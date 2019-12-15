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
using TFI.CORE.Managers;

namespace TFI.GUI
{
    public partial class Contacto : BasePage
    {
        private LenguajeEntidad idioma;
        public MonedaEmpresaEntidad cotizacion;
        public MonedaEntidad moneda;
        private MonedaCore _coreMoneda;

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
            cotizacion = new MonedaEmpresaEntidad();
            moneda = new MonedaEntidad();
            _coreMoneda = new MonedaCore();
        }

        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}

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
                cotizacion = new MonedaEmpresaEntidad();
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];
                Session.Add("cotizacionAnterior", "");

            }
            else
            {
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }
            if (cotizacion != null)
                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }
            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                if (cotizacion != null)
                lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();
        }



        protected void EnviarCorreo(object sender, EventArgs e)
        {



            if (Page.IsValid)
            {
                contenedorsinpedidos.Visible = true;
                notificacion.Visible = true;
                //Obtener host servicio Mail
                TFI.CORE.Servicios.ServicioMailCore.CargarMailConfig();

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
}
