using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class PedidosEnvio : System.Web.UI.Page
    {
        public UsuarioEntidad logueado;
        public List<SucursalEntidad> sucursalesDisponibles;
        public int? seleccionado;
        public int? formaEnvioId;


        private SucursalCore _sucursalCore;

        public PedidosEnvio()
        {
            _sucursalCore = new SucursalCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            seleccionado = (int?)Current.Session["Seleccionada"];
            formaEnvioId = (int?)Current.Session["FormaEnvio"];

            if (logueado == null)
                Response.Redirect("Pedidos.aspx");

            sucursalesDisponibles = _sucursalCore.FindAll();
        }

        [WebMethod]
        public static void Seleccionar(int? id)
        {
            HttpContext.Current.Session["Seleccionada"] = id;
        }

        [WebMethod]
        public static void FormaEnvio(int id)
        {
            HttpContext.Current.Session["FormaEnvio"] = id;
            if(id == (int)FormaEntregaEntidad.Options.Correo)
                HttpContext.Current.Session["Seleccionada"] = null;
        }

        
    }
}