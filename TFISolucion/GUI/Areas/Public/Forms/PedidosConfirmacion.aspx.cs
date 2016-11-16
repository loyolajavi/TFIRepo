﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
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
        public int? pedido;

        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado == null)
                Response.Redirect("Pedidos.aspx");

            lista = (List<PedidoLista>)Current.Session["Pedido"];

            FormaEntrega = (int?)Current.Session["FormaEnvio"];
            pedido = (int?)Current.Session["UltimoPedido"];
            totalizado = lista.Select(x => x.Cantidad * x.Producto.PrecioUnitario).Sum();
            //TODO: sacarle el precio de envio hardcodeado:
            if (FormaEntrega != null && FormaEntrega == (int)FormaEntregaEntidad.Options.Correo)
                totalizado = totalizado + 200;
        }

        [WebMethod]
        public static int GenerarPedido()
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

            var pedido = new PedidoEntidad()
            {
                FechaPedido = DateTime.Now,
                IdFormaEntrega = entregaTipo,
                NombreUsuario = logueado.NombreUsuario,
                CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit,
                Detalles = pedidosDetalles,
                DireccionEntrega = direccionEnvio
            };

            pedido = dal.Create(pedido);

            Current.Session["UltimoPedido"] = pedido.IdPedido;

            return pedido.IdPedido;
        }

        [WebMethod]
        public static void EnviarMailTrasnferencia()
        {
            var Current = HttpContext.Current;
            var logueado = (UsuarioEntidad)Current.Session["Usuario"];

            var correManager = new FUNCIONES.Correo();

            correManager.EnviarCorreo(
                remitente: "francisco.floresfanelli@gmail.com",
                contrasenia: "Novedad01",
                nombre: "Scultural",
                telefono: "12334556",
                destinatario: logueado.Email,
                nombreEmpresa: "Scultural",
                asunto: "Trasnferencia",
                cuerpoCorreo: "DATOS TRANSFERENCIA");
        }

        [WebMethod]
        public static void LimpiarPedido(){
            var Current = HttpContext.Current;
            Current.Session["Productos"] = null;
            Current.Session["UltimoPedido"] = null;
            Current.Session["Pedido"] = null;
        }
    }
}