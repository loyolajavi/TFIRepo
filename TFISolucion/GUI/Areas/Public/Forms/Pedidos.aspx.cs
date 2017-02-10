﻿using System;
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
//namespace TFI.GUI
{
    public partial class Pedidos : System.Web.UI.Page
    {
        public List<ProductoEntidad> productos;
        public List<PedidoLista> lista;
        public MonedaEmpresaEntidad cotizacion;
        public MonedaEntidad moneda;
        private MonedaCore _coreMoneda;
        public string cotizacionAnterior;
        private ProductoCore _coreProducto;
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

        public Pedidos()
        {
            cotizacion = new MonedaEmpresaEntidad();
            moneda = new MonedaEntidad();
            _coreMoneda = new MonedaCore();
            _coreProducto = new ProductoCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cotizacion = new MonedaEmpresaEntidad();
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];
                Session.Add("cotizacionAnterior", "");


            }
            else
            {
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;

            }
            moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);

            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();

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
          
            
            cotizacion = _coreMoneda.Select(cotizacion.IdMoneda);
            var r = (String)Session["cotizacionAnterior"];
            var Current = HttpContext.Current;
            productos = (List<ProductoEntidad>)Current.Session["Productos"];
            var productosRetornar = new List<ProductoEntidad>();
            foreach (var item in productos)
            {
              productosRetornar.Add(_coreProducto.Find(item.IdProducto, cotizacion.IdMoneda));
            }

            productos = productosRetornar;
            //if (cotizacion.Cotizacion > 1 && Convert.ToDecimal(r)!= cotizacion.Cotizacion )
            //{
            //    productos = (List<ProductoEntidad>)Current.Session["Productos"];
                productos.ForEach(x => x.PrecioUnitario = Decimal.Round(x.PrecioUnitario, 2));
            //    Session["cotizacionAnterior"] = cotizacion.Cotizacion.ToString();

            //}
            //else
            //{
            //    productos = (List<ProductoEntidad>)Current.Session["Productos"];

            //    if(r != "")
            //    { productos.ForEach(x => x.PrecioUnitario = decimal.Round(x.PrecioUnitario * Convert.ToDecimal(r), 2)); }
            //    else
            //    {
            //        productos.ForEach(x => x.PrecioUnitario = decimal.Round(x.PrecioUnitario, 2));
            //    }

            //}

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
                foreach (var item in lista)
                {
                    foreach (var p in productos)
                    {
                        if (item.Producto.IdProducto == p.IdProducto)
                        {
                            item.Producto.PrecioUnitario = p.PrecioUnitario;
                        }
                    }


                }
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