using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.FUNCIONES;
using TFI.Entidades;
using TFI.CORE;
using System.Web.Services;

namespace TFI.GUI
{
    public partial class Contacto : BasePage
    {
        private LenguajeEntidad idioma;

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

        public Contacto()
        {
            idioma = new LenguajeEntidad();
        }

        //Para mantener la sesión activa
        [WebMethod(EnableSession = true)]
        public static void MantenerSesion()
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            notificacion.Visible = false;
            contenedorsinpedidos.Visible = false;
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
            }
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }
        }



        protected void EnviarCorreo(object sender, EventArgs e)
        {
            contenedorsinpedidos.Visible = true;
            notificacion.Visible = true;

            //Obtener host servicio Mail
            TFI.CORE.Services.ServicioMailCore.CargarMailConfig();

            TFI.FUNCIONES.ServicioMail.EnviarCorreo("egenloys@gmail.com", txtNombre.Value + txtApellido.Value, txtAsunto.Value, txtMensaje.Value + " " + txtCorreo.Value + " " + txtTelefono.Value);
            //Correo manager = new Correo();
            //manager.EnviarCorreo("egenloys@gmail.com", "Pass123*", txtNombre.Value, txtTelefono.Value,
            //   "egenloys@gmail.com", txtApellido.Value + " " + txtNombre.Value + "-" + txtCorreo.Value, txtAsunto.Value, txtMensaje.Value);
            

            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                if (idioma.DescripcionLenguaje == "es")
                    notificacion.InnerHtml = "<strong>El correo se ha enviado correctamente</strong>";
                else
                    notificacion.InnerHtml = "<strong>The message has been send!</strong>";
                // notificacion.InnerHtml = <%$Resources:Global, co %>;
                //notificacion.InnerText = Resources.Global.correo;
                //notificacion.InnerHtml = "Resources:Global,
                //CorreoEnviadoCorrectamente";
                txtNombre.Value = "";
                txtApellido.Value = "";
                txtAsunto.Value = "";
                txtCorreo.Value = "";
                txtMensaje.Value = "";
                txtTelefono.Value = "";

            }
        }
    }
}
