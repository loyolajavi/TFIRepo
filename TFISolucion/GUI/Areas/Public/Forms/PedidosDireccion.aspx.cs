using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.FUNCIONES;
using TFI.GUI.Helpers.DTO;
using TFI.SEGURIDAD;

namespace TFI.GUI.Areas.Public.Forms
    //namespace TFI.GUI
{
    public partial class PedidosDireccion : BasePage
    {
        public UsuarioEntidad logueado;
        public DireccionEntidad direccionEnvio;
        public DireccionEntidad direccionFacturacion;
        public TelefonoEntidad telefonoContacto;

        protected UsuarioCore _usuarioManager;
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
        public PedidosDireccion()
        {
            idioma = new LenguajeEntidad();
            _usuarioManager = new UsuarioCore();
        }


        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            //En caso de no tener un Pedido vigente redirige a home
            var Current = HttpContext.Current;
            if (Current.Session["Productos"] == null)
                Response.Redirect("/Areas/Public/Forms/Home.aspx");

            logueado = (UsuarioEntidad)Current.Session["Usuario"];
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
            if (logueado != null)
            {
                var dirs = _usuarioManager.FindDireccionesPredeterminadas(logueado);

                direccionEnvio = dirs
                    .Where(x => x.IdTipoDireccion == (int)TipoDireccionEntidad.Options.Envio)
                    .FirstOrDefault();

                direccionFacturacion = dirs
                    .Where(x => x.IdTipoDireccion == (int)TipoDireccionEntidad.Options.Facturacion)
                    .FirstOrDefault();

                telefonoContacto = _usuarioManager.FindTelefonoContacto(logueado.NombreUsuario);
            }
        }

        [WebMethod]
        public static void Login(string user, string pass)
        {
            var manager = new UsuarioCore();

            HttpContext.Current.Session["Usuario"] = manager.loginUsuario(ServicioSecurizacion.AplicarHash(pass), user);
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Master.RealizarLogueo(txtUsuario.Value, txtClave.Value);
        }

       



    }
}