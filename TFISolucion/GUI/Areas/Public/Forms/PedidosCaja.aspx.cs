using System;
using System.Web;
using System.Web.Services;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class PedidosCaja : System.Web.UI.Page
    {
       
        
        public UsuarioEntidad logueado;
        public DireccionEntidad direccionEnvio;
        public TelefonoEntidad telefonoContacto;

        protected UsuarioCore _usuarioManager;

        public PedidosCaja()
        {
            _usuarioManager = new UsuarioCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            logueado = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            if (logueado != null)
            {
                direccionEnvio = _usuarioManager.FindDireccionPredeterminada(logueado.NombreUsuario);
                telefonoContacto = _usuarioManager.FindTelefonoContacto(logueado.NombreUsuario);
            }
        }

        [WebMethod]
        public static void Login(string user, string pass)
        {
            var manager = new UsuarioCore();

            HttpContext.Current.Session["Usuario"] = manager.loginUsuario(pass, user);
        }
    }
}