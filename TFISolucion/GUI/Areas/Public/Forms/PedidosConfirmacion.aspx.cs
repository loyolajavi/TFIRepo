﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.GUI.Helpers.DTO;
using TFI.CORE.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TFI.GUI.Areas.Public.Forms
    //namespace TFI.GUI
{
    public partial class PedidosConfirmacion : BasePage
    {
        public UsuarioEntidad logueado;
        public List<PedidoLista> lista;
        public TarjetaEntidad MiTarjeta;
        public decimal totalizado;
        public int? FormaEntrega;
        public int? pedido;
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
        public PedidosConfirmacion()
        {
            idioma = new LenguajeEntidad();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            SucursalCore coreSucursal = new SucursalCore();
            //Session["FormaEnvio"] = 1;
            Session["Seleccionada"] = coreSucursal.FindAll()[0].IdSucursal;

            idioma = new LenguajeEntidad();
            var Current = HttpContext.Current;
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado == null)
                Response.Redirect("Pedidos.aspx");
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
            lista = (List<PedidoLista>)Current.Session["Pedido"];

            FormaEntrega = (int?)Current.Session["FormaEnvio"];
            //pedido = (int?)Current.Session["UltimoPedido"];
            totalizado = lista.Select(x => x.Cantidad * x.Producto.PrecioUnitario).Sum();
            //TODO: sacarle el precio de envio hardcodeado:
            if (FormaEntrega != null && FormaEntrega == (int)FormaEntregaEntidad.Options.Correo)
                totalizado = totalizado + 100;

            TarjetaCore coreTarjeta = new TarjetaCore();
            List<TarjetaEntidad> MisTarjetas = coreTarjeta.SelectAllTarjetasByCUIT_NombreUsuario(ConfigSection.Default.Site.Cuit, logueado.NombreUsuario);
            foreach(var t in MisTarjetas){
                if(t.Predeterminada == true){
                    MiTarjeta = t;
                }
            }
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

            Current.Session["DetallesPedido"] = pedidosDetalles;
            
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


            //AGREGADO PARA QUE DESCUENTE STOCK AL GENERAR PEDIDO
            foreach(var item in lista){ StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
            NuevoStock.IdProducto = item.Producto.IdProducto;
            NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
            NuevoStock.IdSucursal = (int)sucursalId;

            StockCore StockBLL = new StockCore();

            List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
            StockDeProducto = StockBLL.SelectByIdProducto(NuevoStock.IdProducto);



            if (StockDeProducto.Count > 0)
            {
                NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto - item.Cantidad;
                StockBLL.Update(NuevoStock);
            }
           
}
           

            //HASTA ACA LO DE STOCK

            Current.Session.Add("IdPedido", pedido.IdPedido.ToString());
            Current.Session["FormaEnvio"] = pedido.IdPedido;
            return pedido.IdPedido;

       
        }

        [WebMethod]
        public static void EnviarMailTrasnferencia()
        {
            var Current = HttpContext.Current;
            var logueado = (UsuarioEntidad)Current.Session["Usuario"];
            EmpresaEntidad unaEmpresa = new EmpresaEntidad();
            EmpresaCore unManagerEmpresa = new EmpresaCore();

            unaEmpresa = unManagerEmpresa.EmpresaSelectByCuit(ConfigSection.Default.Site.Cuit);


            var correManager = new FUNCIONES.Correo();

            correManager.EnviarCorreo(
                remitente: "mascoshopp@gmail.com",
                contrasenia: "Descargas123",
                nombre: unaEmpresa.NombreEmpresa,
                telefono: "011-4853340",
                destinatario: logueado.Email,
                nombreEmpresa: unaEmpresa.NombreEmpresa,
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

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            ComprobanteEntidad unComprobante = new ComprobanteEntidad();
            unComprobante.Detalles = new List<ComprobanteDetalleEntidad>();
            ComprobanteCore unManagerComprobante = new ComprobanteCore();
            PedidoCore unManagerPedido = new PedidoCore();
            PedidoEstadoPedidoEntidad pedidoEstadoPedido = new PedidoEstadoPedidoEntidad();
            //List<ComprobanteDetalleEntidad> unosDetallesComprobante = new List<ComprobanteDetalleEntidad>();
            
            List<PedidoDetalleEntidad> unosDetallesPedido = new List<PedidoDetalleEntidad>();
            var Current = HttpContext.Current;
            int ContadorDetalle = 0;

            logueado = (UsuarioEntidad)Current.Session["Usuario"];
            var sucursalId = (int?)Current.Session["Seleccionada"];

            unosDetallesPedido = (List<PedidoDetalleEntidad>)Current.Session["DetallesPedido"];


            string NroCompSolo = "";
            int NroComp;

            if (unManagerComprobante.FindAll().Count == 0)
            {
                NroCompSolo = "0"; 
            }


                //Toma el nro de comprobante y lo desglosa para formar el nuevo nro de comprobante

                if (NroCompSolo != "0")
                {
                    NroComp = unManagerComprobante.FindAll().LastOrDefault().NroComprobante;
                    var NroCompString = NroComp.ToString();
                    NroCompSolo = NroCompString;
                    //NroCompSolo = NroCompString.Remove(0, 2);
                }
                
                
                NroComp = int.Parse(NroCompSolo) + 1;

               // unComprobante.NroComprobante = int.Parse(logueado.IdCondicionFiscal.ToString() + sucursalId.ToString() + NroComp.ToString());

                unComprobante.NroComprobante = NroComp;

                unComprobante.IdSucursal = (int)sucursalId;

                if (logueado.IdCondicionFiscal == 1)
                {
                    unComprobante.IdTipoComprobante = 2;//Factura B
                }
                else if (logueado.IdCondicionFiscal == 2)
                {
                    unComprobante.IdTipoComprobante = 1; //Factura A
                }
                
                unComprobante.FechaComprobante = DateTime.Now;
                unComprobante.IdPedido = (int)Current.Session["UltimoPedido"];

                foreach (var item in unosDetallesPedido)
                {
                    ComprobanteDetalleEntidad unDetalleComprobante = new ComprobanteDetalleEntidad();
                    ContadorDetalle = ContadorDetalle + 1;
                    unDetalleComprobante.IdComprobanteDetalle = ContadorDetalle;
                    unDetalleComprobante.NroComprobante = unComprobante.NroComprobante;
                    unDetalleComprobante.IdSucursal = unComprobante.IdSucursal;
                    unDetalleComprobante.IdTipoComprobante = unComprobante.IdTipoComprobante;
                    unDetalleComprobante.CUIT = ConfigSection.Default.Site.Cuit;
                    unDetalleComprobante.IdProducto = item.IdProducto;
                    unDetalleComprobante.CantidadProducto = item.Cantidad;
                    unDetalleComprobante.PrecioUnitarioFact = item.PrecioUnitario;

                    unComprobante.Detalles.Add(unDetalleComprobante);
                    //unosDetallesComprobante.Add(unDetalleComprobante);
                }


                unManagerComprobante.Create(unComprobante);

                pedidoEstadoPedido.IdPedido = (int)Current.Session["UltimoPedido"];
                pedidoEstadoPedido.IdEstadoPedido = 6;//Finalizado
                pedidoEstadoPedido.Fecha = DateTime.Now;

                unManagerPedido.FinalizarPedido(pedidoEstadoPedido);

                
                LimpiarPedido();

                

                //Response.Redirect("/Areas/Public/Forms/UltimosPedidos.aspx");
                

           

            


        }

        [WebMethod]
        public static void CambiarTarjeta()
        {
           
            //Cancelo el pedido, dps se vuelve a generar con la nueva tarjeta
            var Current = HttpContext.Current;
            string IdPedido = Current.Session["IdPedido"].ToString();

            if (IdPedido != "")
            {
                PedidoCore pedidoCore = new PedidoCore();
                PedidoEstadoPedidoEntidad EstadoActualizado = new PedidoEstadoPedidoEntidad();
                EstadoActualizado.IdPedido = Convert.ToInt32(IdPedido);
                EstadoActualizado.IdEstadoPedido = 2; //CANCELADO
                EstadoActualizado.Fecha = DateTime.Now;
                pedidoCore.PedidoEstadoPedidoUpdate(EstadoActualizado);
            }
            var lista = (List<PedidoLista>)Current.Session["Pedido"];
            foreach (var item in lista)
            {
                StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
                NuevoStock.IdProducto = item.Producto.IdProducto;
                NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
                var sucursalId = (int?)Current.Session["Seleccionada"];
                NuevoStock.IdSucursal = (int)sucursalId;

                StockCore StockBLL = new StockCore();

                List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
                StockDeProducto = StockBLL.SelectByIdProducto(NuevoStock.IdProducto);



                if (StockDeProducto.Count > 0)
                {
                    NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + item.Cantidad;
                    StockBLL.Update(NuevoStock);
                }
            }
           

        }

        [WebMethod]
        public static void PagarWebMethod()
        {
            ComprobanteEntidad unComprobante = new ComprobanteEntidad();
            unComprobante.Detalles = new List<ComprobanteDetalleEntidad>();
            ComprobanteCore unManagerComprobante = new ComprobanteCore();
            PedidoCore unManagerPedido = new PedidoCore();
            PedidoEstadoPedidoEntidad pedidoEstadoPedido = new PedidoEstadoPedidoEntidad();
            //List<ComprobanteDetalleEntidad> unosDetallesComprobante = new List<ComprobanteDetalleEntidad>();

            List<PedidoDetalleEntidad> unosDetallesPedido = new List<PedidoDetalleEntidad>();
            var Current = HttpContext.Current;
            int ContadorDetalle = 0;

            var logueado = (UsuarioEntidad)Current.Session["Usuario"];
            var sucursalId = (int?)Current.Session["Seleccionada"];

            unosDetallesPedido = (List<PedidoDetalleEntidad>)Current.Session["DetallesPedido"];


            string NroCompSolo = "";
            int NroComp;

            if (unManagerComprobante.FindAll().Count == 0)
            {
                NroCompSolo = "0";
            }


            //Toma el nro de comprobante y lo desglosa para formar el nuevo nro de comprobante

            if (NroCompSolo != "0")
            {
                NroComp = unManagerComprobante.FindAll().LastOrDefault().NroComprobante;
                var NroCompString = NroComp.ToString();
                NroCompSolo = NroCompString;
                //NroCompSolo = NroCompString.Remove(0, 2);
            }


            NroComp = int.Parse(NroCompSolo) + 1;

            // unComprobante.NroComprobante = int.Parse(logueado.IdCondicionFiscal.ToString() + sucursalId.ToString() + NroComp.ToString());

            unComprobante.NroComprobante = NroComp;

            unComprobante.IdSucursal = (int)sucursalId;

            if (logueado.IdCondicionFiscal == 1)
            {
                unComprobante.IdTipoComprobante = 2;//Factura B
            }
            else if (logueado.IdCondicionFiscal == 2)
            {
                unComprobante.IdTipoComprobante = 1; //Factura A
            }

            unComprobante.FechaComprobante = DateTime.Now;
            unComprobante.IdPedido = (int)Current.Session["UltimoPedido"];

            foreach (var item in unosDetallesPedido)
            {
                ComprobanteDetalleEntidad unDetalleComprobante = new ComprobanteDetalleEntidad();
                ContadorDetalle = ContadorDetalle + 1;
                unDetalleComprobante.IdComprobanteDetalle = ContadorDetalle;
                unDetalleComprobante.NroComprobante = unComprobante.NroComprobante;
                unDetalleComprobante.IdSucursal = unComprobante.IdSucursal;
                unDetalleComprobante.IdTipoComprobante = unComprobante.IdTipoComprobante;
                unDetalleComprobante.CUIT = ConfigSection.Default.Site.Cuit;
                unDetalleComprobante.IdProducto = item.IdProducto;
                unDetalleComprobante.CantidadProducto = item.Cantidad;
                unDetalleComprobante.PrecioUnitarioFact = item.PrecioUnitario;

                unComprobante.Detalles.Add(unDetalleComprobante);
                //unosDetallesComprobante.Add(unDetalleComprobante);
            }


            unManagerComprobante.Create(unComprobante);

            pedidoEstadoPedido.IdPedido = (int)Current.Session["UltimoPedido"];
            pedidoEstadoPedido.IdEstadoPedido = 6;//Finalizado
            pedidoEstadoPedido.Fecha = DateTime.Now;

            unManagerPedido.FinalizarPedido(pedidoEstadoPedido);


            LimpiarPedido();



            //Response.Redirect("/Areas/Public/Forms/UltimosPedidos.aspx");







        }
    }
}