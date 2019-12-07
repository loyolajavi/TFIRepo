using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.SEGURIDAD;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class Backup : BasePage
    {
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
                idioma = (LenguajeEntidad)Current.Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Current.Session["Idioma"] = idioma;
                }
            }
            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Current.Session["Idioma"] = idioma;
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }
            usuarioentidad = (UsuarioEntidad)Current.Session["Usuario"];

            string[] unosPermisosTest = new string[] { "Publico", "Cliente" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            unosPermisosTest = new string[] { "Empleado" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try 
	        {
                //string fecha = DateTime.Now.ToString("yyyy-MM-dd h-mm tt").Trim() + ".bak";
                //string nombre = "BKPGenloysBD-" + fecha;
                if (!string.IsNullOrWhiteSpace(txtNombreArchivo.Text))
                {
                    string nombre = txtNombreArchivo.Text.Trim() + ".bak";
                    string ruta = Server.MapPath(@"../../../Content/Files/" + nombre);
                    if (File.Exists(ruta))
                    {
                        File.Delete(ruta);
                    }
                    if (ServicioBackup.Respaldar(nombre, ruta, "Obs"))
                    {
                        ServicioLog.CrearLog("Backup", "Backup realizado correctamente", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                        Current.Response.ContentType = "application/octet-stream";
                        Current.Response.AppendHeader("Content-Disposition", "attachment; " + "filename=" + nombre + "");
                        Current.Response.TransmitFile(Server.MapPath(@"../../../Content/Files/" + nombre));
                        Current.Response.Flush();
                        //Current.Response.End();  //Causa Exception
                        Current.Response.SuppressContent = true;
                        Current.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        ServicioLog.CrearLog("Backup", "Backup fallido", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                        sb.Append(@"<script type='text/javascript'>");
                        //sb.Append("$('#currentdetail').modal('show');");
                        sb.Append("alert('No pudo realizarse el backup');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "BackupFallido", sb.ToString(), false);
                    }
                }
                else
                {
                    sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#currentdetail').modal('show');");
                    sb.Append("alert('Complete el campo Nombre');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "CompletarNombre", sb.ToString(), false);
                }
                
	        }
	        catch (Exception es)
	        {
		        ServicioLog.CrearLog(es, "Backup", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                Response.Redirect("../../../Shared/Errores.aspx");
	        }
                    
        }



    }
}