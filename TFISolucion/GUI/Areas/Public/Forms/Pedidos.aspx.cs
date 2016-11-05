using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TFI.Entidades;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class Pedidos : System.Web.UI.Page
    {
        private EstadoPedidoEntidad _pedido;
        public List<ProductoEntidad> productos;
        public List<PedidoLista> lista;

        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;

            productos = (List<ProductoEntidad>)Current.Session["Productos"];

            lista = (List<PedidoLista>)Current.Session["Pedido"];

            if (productos == null || !productos.Any())
            {
                MostrarCarritoVacio();
            }

            if (productos != null)
            {
                RedondearPrecioUnitario();

                CrearPedidoLista();
            }
        }

        private void RedondearPrecioUnitario()
        {
            productos.ForEach(x => x.PrecioUnitario = Decimal.Round(x.PrecioUnitario, 2));
        }

        [WebMethod]
        public static void DeleteItem(int id)
        {
            var Current = HttpContext.Current;
            var list = (List<ProductoEntidad>)Current.Session["Productos"];
            Current.Session["Productos"] = list.Where(x => x.IdProducto != id).ToList();
        }

        private void MostrarCarritoVacio()
        {
            notificacionCarritoVacio.InnerHtml = "<span>" + "Su Carrito esta Vacio" + "</span>";
            notificacionCarritoVacio.Attributes.Remove("hidden");
        }

        private void CrearPedidoLista()
        {
            var Current = HttpContext.Current;

            if (lista == null || !lista.Any())
            {
                Current.Session["Pedido"] = new List<PedidoLista>();
                lista = new List<PedidoLista>();
            }
            productos.ForEach(x => lista.Add(new PedidoLista() { Producto = x, Cantidad = 1, Stock = true }));
        }

        public class PedidoLista
        {
            public ProductoEntidad Producto { get; set; }
            public int Cantidad { get; set; }
            public bool Stock { get; set; }
        }
    }
}