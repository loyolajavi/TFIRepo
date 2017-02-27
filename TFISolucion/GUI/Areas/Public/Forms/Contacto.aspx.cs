using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.FUNCIONES;
using TFI.Entidades;

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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                notificacion.Visible = false;

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
            Correo manager = new Correo();
            manager.EnviarCorreo("martinez.juan.marcos@gmail.com", "descargas", txtNombre.Value, txtTelefono.Value,
               "martinez.juan.marcos@gmail.com", txtApellido.Value + " "+   txtNombre.Value +"-"+ txtCorreo.Value, txtAsunto.Value , txtMensaje.Value);
            {
                notificacion.InnerHtml = "<strong>El correo se ha enviado correctamente</strong>";
                // notificacion.InnerHtml = <%$Resources:Global, Correo %>;
                //notificacion.InnerText = Resources.Global.Correo;
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
