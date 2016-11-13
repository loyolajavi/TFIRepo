using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TFI.Entidades;
using TFI.GUI.Helpers.DTO;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class Pedidos : System.Web.UI.Page
    {
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
            var pedido = (List<PedidoLista>)Current.Session["Pedido"];
            Current.Session["Productos"] = list.Where(x => x.IdProducto != id).ToList();
            Current.Session["Pedido"] = pedido.Where(x => x.Producto.IdProducto != id).ToList();
        }

        private void MostrarCarritoVacio()
        {
            notificacionCarritoVacio.InnerHtml = "<span>" + "Su Carrito esta Vacio" + "</span>";
            notificacionCarritoVacio.Attributes.Remove("hidden");
        }

        [WebMethod]
        public static Decimal ActualizarCantidad(int id, int cantidad)
        {
            ((List<PedidoLista>)HttpContext.Current.Session["Pedido"])
                .Where(x => x.Producto.IdProducto == id)
                .First().Cantidad = cantidad;

            var precio = ((List<PedidoLista>)HttpContext.Current.Session["Pedido"]).Where(x => x.Producto.IdProducto == id).First().Producto.PrecioUnitario;

            return precio * cantidad;
        }

        private void CrearPedidoLista()
        {
            var Current = HttpContext.Current;

            if (lista == null || !lista.Any())
            {
                lista = new List<PedidoLista>();
                productos.ForEach(x =>
                    lista.Add(new PedidoLista()
                        {
                            Producto = x,
                            Cantidad = 1,
                            Stock = true
                        }));

                Current.Session["Pedido"] = lista;
            }
            else
            {
                var idsProductos = lista.Select(x => x.Producto.IdProducto).Distinct();
                var nuevos = productos.Where(x => !idsProductos.Contains(x.IdProducto));

                if (nuevos != null && nuevos.Any())
                {
                    nuevos
                        .ToList()
                        .ForEach(x => lista.Add(new PedidoLista()
                            {
                                Producto = x,
                                Cantidad = 1,
                                Stock = true
                            }));

                    Current.Session["Pedido"] = lista;
                }
            }
        }
    }
}