using System;
using System.Linq;
using System.Web;
using System.Web.Services;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.FUNCIONES;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class PedidosDireccion : System.Web.UI.Page
    {
        public UsuarioEntidad logueado;
        public DireccionEntidad direccionEnvio;
        public DireccionEntidad direccionFacturacion;
        public TelefonoEntidad telefonoContacto;

        protected UsuarioCore _usuarioManager;

        public PedidosDireccion()
        {
            _usuarioManager = new UsuarioCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            logueado = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            if (logueado != null)
            {
                var dirs = _usuarioManager.FindDireccionesPredeterminadas(logueado.NombreUsuario);

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

            HttpContext.Current.Session["Usuario"] = manager.loginUsuario(Encriptacion.ToHash(pass), user);
        }
    }
}