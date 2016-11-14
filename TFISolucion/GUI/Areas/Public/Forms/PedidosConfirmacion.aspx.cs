using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.GUI.Helpers.DTO;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class PedidosConfirmacion : System.Web.UI.Page
    {
        public UsuarioEntidad logueado;
        public List<PedidoLista> lista;
        public decimal totalizado;
        public int? FormaEntrega;


        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado == null)
                Response.Redirect("Pedidos.aspx");

            lista = (List<PedidoLista>)Current.Session["Pedido"];

            FormaEntrega = (int?)Current.Session["FormaEnvio"];

            totalizado = lista.Select(x => x.Cantidad * x.Producto.PrecioUnitario).Sum();
            //TODO: sacarle el precio de envio hardcodeado:
            if (FormaEntrega != null && FormaEntrega == (int)FormaEntregaEntidad.Options.Correo)
                totalizado = totalizado + 200;

        }

        [WebMethod]
        public static void GenerarPedido()
        {
            var Current = HttpContext.Current;

            var lista = (List<PedidoLista>)Current.Session["Pedido"];
            var entregaTipo = (int)Current.Session["FormaEnvio"];
            var logueado = (UsuarioEntidad)Current.Session["Usuario"];
            var sucursalId = (int?)Current.Session["Seleccionada"];
            var pedidosDetalles = new List<PedidoDetalleEntidad>();

            var usuarioManager = new UsuarioCore();
            var sucursalManager = new SucursalCore();

            var direccionEnvio = entregaTipo == (int)FormaEntregaEntidad.Options.Correo
                                ? usuarioManager.FindDireccionEnvioPredeterminada(logueado.NombreUsuario).IdDireccion
                                : sucursalManager.FindDireccionSucursal(sucursalId.Value).IdDireccion;

            lista.ForEach(x => pedidosDetalles.Add(new PedidoDetalleEntidad()
            {
                Cantidad = x.Cantidad,
                PrecioUnitario = x.Producto.PrecioUnitario,
                IdProducto = x.Producto.IdProducto,
                CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit
            }));

            var dal = new PedidoCore();

            var pedido = new PedidoEntidad() {
                FechaPedido = DateTime.Now,
                IdFormaEntrega = entregaTipo,
                NombreUsuario = logueado.NombreUsuario,
                CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit,
                Detalles = pedidosDetalles,
                DireccionEntrega = direccionEnvio
            };

            dal.Create(pedido);



        }
    }
}