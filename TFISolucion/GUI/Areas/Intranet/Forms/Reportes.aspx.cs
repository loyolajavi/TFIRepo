using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.SEGURIDAD;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class Reportes : BasePage
    {
        private ReporteCore managerReportes = new ReporteCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        private HttpContext Current = HttpContext.Current;

        protected T FindControlFromMaster<T>(string name) where T : Control
        {
            MasterPage master = this.Master;
            while (master != null)
            {
                T control = master.FindControl(name) as T;
                if (control != null)
                    return control;

                master = master.Master;
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            if (!IsPostBack)
            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }
            }
            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }

            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            string[] unosPermisosTest = new string[] { "Reportes" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }


        }
        protected void btnReportePxF_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
                if (!string.IsNullOrEmpty(elIdFechaInicio.Value) | !string.IsNullOrWhiteSpace(elIdFechaFin.Value))
                {
                    DateTime? fechaInicio = null;
                    DateTime? fechaFin = null;
                    if (!string.IsNullOrEmpty(elIdFechaInicio.Value))
                        fechaInicio = DateTime.Parse(elIdFechaInicio.Value);
                    if (!string.IsNullOrEmpty(elIdFechaFin.Value))
                        fechaFin = DateTime.Parse(elIdFechaFin.Value);

                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=" + "Pedidos" + " " + DateTime.Now + ".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(managerReportes.ReportePedidosPorFechayEstado(fechaInicio, fechaFin));
                    Current.Response.Flush();
                    //Current.Response.End();  //Causa Exception
                    Current.Response.SuppressContent = true;
                    Current.ApplicationInstance.CompleteRequest();
                }
                              

                //sb.Append(@"<script type='text/javascript'>");
                ////sb.Append("$('#currentdetail').modal('show');");
                //sb.Append("alert('Deben completarse ambas fechas');");
                //sb.Append(@"</script>");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                //           "CompletarFechas", sb.ToString(), false);
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "Reporte por Fecha", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                Response.Redirect("../../../Shared/Errores.aspx");
            }
        }

        protected void btnReportePxU_Click(object sender, EventArgs e)
        {
            try
            {
                    DateTime? fechaInicio = null;
                    DateTime? fechaFin = null;
                    if (!string.IsNullOrEmpty(txtfechaInicio.Value))
                        fechaInicio = DateTime.Parse(txtfechaInicio.Value);
                    if (!string.IsNullOrEmpty(txtfechaFin.Value))
                        fechaFin = DateTime.Parse(txtfechaFin.Value);
                    if (txtUsuario.Text != "")
                    {
                        Response.Clear();
                        Response.ContentType = "application/pdf";
                        Response.AddHeader("content-disposition", "attachment;filename=" + "Pedidos del usuario" + " " + txtUsuario.Text + ".pdf");
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.BinaryWrite(managerReportes.ReportePedidosDeUsuario(txtUsuario.Text, fechaInicio, fechaFin));
                        Current.Response.Flush();
                        //Current.Response.End();  //Causa Exception
                        Current.Response.SuppressContent = true;
                        Current.ApplicationInstance.CompleteRequest();
                    }
                    else
                        NotificacionNombreUsuario();
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "Reporte por Usuario", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                Response.Redirect("../../../Shared/Errores.aspx");
            }
          
        }
        private void NotificacionNombreUsuario()
        {
            notificationTarjeta.InnerHtml = "Ingrese nombre usuario";
            //notificationTarjeta.Visible = true;

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Ingrese el Nombre de Usuario');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                       "ModalScript", sb.ToString(), false);
        }
    }
}