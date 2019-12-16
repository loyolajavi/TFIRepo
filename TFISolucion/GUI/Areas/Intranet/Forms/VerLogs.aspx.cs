using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;
using TFI.Entidades;
using TFI.CORE.Servicios;
using TFI.SEGURIDAD;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class VerLogs : BasePage
    {

        List<BitacoraLogEntidad> unosLogs = new List<BitacoraLogEntidad>();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        BLLBitacora ManagerBitacora = new BLLBitacora();

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

            string[] unosPermisosTest = new string[] { "Logs" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }


         

        }

        protected void btnFiltrarLogs_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
                if (string.IsNullOrWhiteSpace(elIdFechaInicio.Value) | string.IsNullOrWhiteSpace(elIdFechaFin.Value))
                {
                    sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#currentdetail').modal('show');");
                    sb.Append("alert('Deben completarse ambas fechas');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "CompletarFechas", sb.ToString(), false);
                }
                else
                {
                    DateTime unaFechaInicio = DateTime.Parse(elIdFechaInicio.Value);
                    DateTime unaFechaFin = DateTime.Parse(elIdFechaFin.Value);
                    if (unaFechaInicio > unaFechaFin | unaFechaInicio < DateTime.Parse("1990/01/01") | unaFechaFin > DateTime.Parse("2999/12/12"))
                    {
                        sb.Append(@"<script type='text/javascript'>");
                        //sb.Append("$('#currentdetail').modal('show');");
                        sb.Append("alert('La fecha de inicio debe ser menor que la fecha de fin');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "FechaInicioFin", sb.ToString(), false);
                    }
                    else
                    {
                        unosLogs = ManagerBitacora.BitacoraVerLogs(idelTIpoLog.Value, unaFechaInicio, unaFechaFin);
                        grillaLogs.DataSource = null;
                        grillaLogs.DataSource = unosLogs;
                        grillaLogs.DataBind();
                    }
                }
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "Filtrar Logs", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                Response.Redirect("../../../Shared/Errores.aspx");
            }
        }


        protected void grillaLogs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grillaLogs.PageIndex = e.NewPageIndex;
            unosLogs = ManagerBitacora.BitacoraVerLogs(idelTIpoLog.Value, DateTime.Parse(elIdFechaInicio.Value), DateTime.Parse(elIdFechaFin.Value));
            grillaLogs.DataSource = null;
            grillaLogs.DataSource = unosLogs;
            grillaLogs.DataBind();
        }
    }
}