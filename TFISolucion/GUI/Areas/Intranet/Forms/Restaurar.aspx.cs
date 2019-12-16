using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.SEGURIDAD;
using System.IO;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class Restaurar : BasePage
    {

        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        string unaRuta;

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

            string[] unosPermisosTest = new string[] { "Restaurar" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }


         
        }

        protected void btnRestaurar_Click(object sender, EventArgs e)
        {
            
            
                
        }

       
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string filePath = string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
                string NombreBD = Request["txtNombreBD"];
                if (!string.IsNullOrWhiteSpace(NombreBD))
                {
                    if (fileUpload.HasFile)
                    {
                        string fileExt = System.IO.Path.GetExtension(fileUpload.FileName);
                        if (fileExt.ToLower() != ".bak")
                        {
                            lblMsg.Text = "Únicamente se permiten archivos .bak";
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                        filePath = fileUpload.PostedFile.FileName;
                        if (File.Exists(Server.MapPath(@"../../../Content/Files/" + filePath.Trim())))
                        {
                            File.Delete(Server.MapPath(@"../../../Content/Files/" + filePath.Trim()));
                        }
                        fileUpload.PostedFile.SaveAs(Server.MapPath(@"../../../Content/Files/" + filePath.Trim()));

                        if (!ServicioBackup.Restaurar(NombreBD, Server.MapPath(@"../../../Content/Files/" + filePath.Trim())))
                        {
                            TFI.SEGURIDAD.ServicioLog.CrearLog("Restaurar", "Restauración fallida", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                            sb.Append(@"<script type='text/javascript'>");
                            //sb.Append("$('#currentdetail').modal('show');");
                            sb.Append("alert('No pudo restaurarse la base de datos');");
                            sb.Append(@"</script>");
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                       "RestauracionOK", sb.ToString(), false);
                        }
                        else
                        {
                            TFI.SEGURIDAD.ServicioLog.CrearLog("Restaurar", "Restauración realizada correctamente", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                            //this.Master.CerrarSesion();
                            Session.Abandon();
                            //sb.Append(@"<script type='text/javascript'>");
                            ////sb.Append("$('#currentdetail').modal('show');");
                            //sb.Append("alert('Se restauró la base de datos correctamente, por favor ingrese nuevamente a la aplicación');");
                            //sb.Append("app.redirect('Home.aspx');");
                            //sb.Append(@"</script>");
                            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                            //           "RestauracionOK", sb.ToString(), false);
                            Response.Redirect("/Areas/Public/Forms/Home.aspx", false);
                        }
                    }
                    else
                    {
                        sb.Append(@"<script type='text/javascript'>");
                        //sb.Append("$('#currentdetail').modal('show');");
                        sb.Append("alert('Seleccione el archivo .bak');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "FaltaRuta", sb.ToString(), false);
                    }
                }
                else
                {
                    sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#currentdetail').modal('show');");
                    sb.Append("alert('Ingrese el nombre de la base de datos');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "IngresarNombreBD", sb.ToString(), false);
                }

            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "Restaurar", usuarioentidad.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
                //System.Text.StringBuilder sbCatch = new System.Text.StringBuilder();
                //sbCatch.Append(@"<script type='text/javascript'>");
                ////sb.Append("$('#currentdetail').modal('show');");
                //sbCatch.Append("alert('Error al intentar restaurar la base de datos');");
                //sbCatch.Append(@"</script>");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                //           "RestauracionOK", sbCatch.ToString(), false);
                Response.Redirect("../../../Shared/Errores.aspx");
            }

        }

       
    }
}