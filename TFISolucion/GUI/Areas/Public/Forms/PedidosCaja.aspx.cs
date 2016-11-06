using System;
using System.Web;
using System.Web.Services;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class PedidosCaja : System.Web.UI.Page
    {
        public HttpContext Current = HttpContext.Current;
        public UsuarioEntidad logueado;
               

        protected UsuarioCore _usuarioManager;

        public PedidosCaja()
        {
            _usuarioManager = new UsuarioCore();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado != null)
            { 
                
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