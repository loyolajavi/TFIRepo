using System;
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
using System.IO;
using System.Text;
using System.Web.Script.Services;

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

        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}


        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            SucursalCore coreSucursal = new SucursalCore();
            //Session["FormaEnvio"] = 1;
            //Session["Seleccionada"] = coreSucursal.FindAll()[0].IdSucursal;

            

            idioma = new LenguajeEntidad();
            
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado == null)
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
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
            if (!IsPostBack)
            {
                if (Current.Session["Productos"] == null)
                    Response.Redirect("/Areas/Public/Forms/Home.aspx");
                lista = (List<PedidoLista>)Current.Session["Pedido"];

                FormaEntrega = (int?)Current.Session["FormaEnvio"];
                //pedido = (int?)Current.Session["UltimoPedido"];
                totalizado = lista.Select(x => x.Cantidad * x.Producto.PrecioUnitario).Sum();
                //TODO: sacarle el precio de envio hardcodeado:
                if (FormaEntrega != null && FormaEntrega == (int)FormaEntregaEntidad.Options.Correo)
                    totalizado = totalizado + 100;
            }
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
            PedidoCore ManagerPedido = new PedidoCore();

            var lista = (List<PedidoLista>)Current.Session["Pedido"];
            var entregaTipo = (int)Current.Session["FormaEnvio"];
            var logueado = (UsuarioEntidad)Current.Session["Usuario"];
            var sucursalesDisponibles = HttpContext.Current.Session["SucursalesDisponibles"];
            var sucursalId = (int?)Current.Session["Seleccionada"];
            List<PedidoDetalleEntidad> pedidosDetalles = new List<PedidoDetalleEntidad>();
            List<PedidoEntidad> unasCompras = new List<PedidoEntidad>();
            DireccionEntidad unaDireccion;
            UsuarioCore usuarioManager = new UsuarioCore();
            DireccionCore ManagerDireccion = new DireccionCore();

            //var direccionEnvio = entregaTipo == (int)FormaEntregaEntidad.Options.Correo
            //                    ? usuarioManager.FindDireccionEnvioPredeterminada(logueado.NombreUsuario).IdDireccion
            //                    : sucursalManager.FindDireccionSucursal(sucursalId.Value).IdDireccion;

            unaDireccion = ManagerDireccion.TraerDireccionPorIdSucursal(sucursalId.Value);



            foreach (PedidoLista item in lista)
            {
                PedidoDetalleEntidad unPedDet = new PedidoDetalleEntidad();
                unPedDet.Cantidad = item.Cantidad;
                unPedDet.PrecioUnitario = item.Producto.PrecioUnitario;
                unPedDet.miProducto = new ProductoEntidad();
                unPedDet.miProducto.IdProducto = item.Producto.IdProducto;
                unPedDet.CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit;
                pedidosDetalles.Add(unPedDet);
            }
            
            //lista.ForEach(x => pedidosDetalles.Add(new PedidoDetalleEntidad()
            //{
            //    Cantidad = x.Cantidad,
            //    PrecioUnitario = x.Producto.PrecioUnitario,
            //    IdProducto = x.Producto.IdProducto,
            //    CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit
            //}));

            Current.Session["DetallesPedido"] = pedidosDetalles;
            
            

            var pedido = new PedidoEntidad()
            {
                FechaPedido = DateTime.Now,
                NombreUsuario = logueado.NombreUsuario,
                CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit,
                misDetalles = pedidosDetalles,
                
            };

            pedido.miFormaEntrega = new FormaEntregaEntidad();
            pedido.miFormaEntrega.IdFormaEntrega = entregaTipo;
            pedido.miDireccionEntrega = new DireccionEntidad();
            pedido.miDireccionEntrega.IdDireccion = unaDireccion.IdDireccion;
            pedido.DefinirEstado(new Entidades.StatePatron.StatePendientePago());
            ManagerPedido.PedidoSetearEstadoDescripEnMemoria(pedido);

            //Crea el Pedido y descuenta stock de los productos
            pedido = ManagerPedido.Create(pedido, sucursalId);

            //Agrega a "Compras" el pedido generado
            Current.Session["UltimoPedido"] = pedido.IdPedido;
            if (Current.Session["Compras"] != null)
                unasCompras = Current.Session["Compras"] as List<PedidoEntidad>;
            unasCompras.Add(pedido);
            Current.Session["Compras"] = unasCompras;
            
            //Eliminar las variables de sesión que tenían el pedido en memoria sin confirmar
            //Revisar si hay q eliminar otras
            Current.Session["Pedido"] = null;
            //Current.Session["DetallesPedido"] = null;
            Current.Session["Productos"] = null;

            //Current.Session.Add("IdPedido", pedido.IdPedido.ToString());
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

            //Obtener host servicio Mail
            TFI.CORE.Services.ServicioMailCore.CargarMailConfig();
            TFI.FUNCIONES.ServicioMail.EnviarCorreo(logueado.Email, unaEmpresa.NombreEmpresa, "Datos para la Transferencia", unaEmpresa.CUIT);
        }


        [WebMethod]
        public static void LimpiarPedido(){
            var Current = HttpContext.Current;
            Current.Session["Productos"] = null;
            Current.Session["UltimoPedido"] = null;
            Current.Session["Pedido"] = null;
            Current.Session["DetallesPedido"] = null;
        }

        //protected void btnPagar_Click(object sender, EventArgs e) No lo utilizo más
        //{
        //    ComprobanteEntidad unComprobante = new ComprobanteEntidad();
        //    unComprobante.Detalles = new List<ComprobanteDetalleEntidad>();
        //    ComprobanteCore unManagerComprobante = new ComprobanteCore();
        //    PedidoCore unManagerPedido = new PedidoCore();
        //    PedidoEstadoPedidoEntidad pedidoEstadoPedido = new PedidoEstadoPedidoEntidad();
        //    //List<ComprobanteDetalleEntidad> unosDetallesComprobante = new List<ComprobanteDetalleEntidad>();
        //    List<PedidoDetalleEntidad> unosDetallesPedido = new List<PedidoDetalleEntidad>();
        //    var Current = HttpContext.Current;
        //    int ContadorDetalle = 0;

        //    logueado = (UsuarioEntidad)Current.Session["Usuario"];
        //    var sucursalId = (int?)Current.Session["Seleccionada"];

        //    unosDetallesPedido = (List<PedidoDetalleEntidad>)Current.Session["DetallesPedido"];


        //    string NroCompSolo = "";
        //    int NroComp;

        //    if (unManagerComprobante.FindAll().Count == 0)
        //    {
        //        NroCompSolo = "0"; 
        //    }


        //        //Toma el nro de comprobante y lo desglosa para formar el nuevo nro de comprobante

        //        if (NroCompSolo != "0")
        //        {
        //            NroComp = unManagerComprobante.FindAll().LastOrDefault().NroComprobante;
        //            var NroCompString = NroComp.ToString();
        //            NroCompSolo = NroCompString;
        //            //NroCompSolo = NroCompString.Remove(0, 2);
        //        }
                
                
        //        NroComp = int.Parse(NroCompSolo) + 1;

        //       // unComprobante.NroComprobante = int.Parse(logueado.IdCondicionFiscal.ToString() + sucursalId.ToString() + NroComp.ToString());

        //        unComprobante.NroComprobante = NroComp;

        //        unComprobante.IdSucursal = (int)sucursalId;

        //        if (logueado.IdCondicionFiscal == 1)
        //        {
        //            unComprobante.IdTipoComprobante = 2;//Factura B
        //        }
        //        else if (logueado.IdCondicionFiscal == 2)
        //        {
        //            unComprobante.IdTipoComprobante = 1; //Factura A
        //        }
                
        //        unComprobante.FechaComprobante = DateTime.Now;
        //        unComprobante.IdPedido = (int)Current.Session["UltimoPedido"];

        //        foreach (var item in unosDetallesPedido)
        //        {
        //            ComprobanteDetalleEntidad unDetalleComprobante = new ComprobanteDetalleEntidad();
        //            ContadorDetalle = ContadorDetalle + 1;
        //            unDetalleComprobante.IdComprobanteDetalle = ContadorDetalle;
        //            unDetalleComprobante.NroComprobante = unComprobante.NroComprobante;
        //            unDetalleComprobante.IdSucursal = unComprobante.IdSucursal;
        //            unDetalleComprobante.IdTipoComprobante = unComprobante.IdTipoComprobante;
        //            unDetalleComprobante.CUIT = ConfigSection.Default.Site.Cuit;
        //            unDetalleComprobante.IdProducto = item.IdProducto;
        //            unDetalleComprobante.CantidadProducto = item.Cantidad;
        //            unDetalleComprobante.PrecioUnitarioFact = item.PrecioUnitario;

        //            unComprobante.Detalles.Add(unDetalleComprobante);
        //            //unosDetallesComprobante.Add(unDetalleComprobante);
        //        }
        //        unManagerComprobante.Create(unComprobante);

        //        pedidoEstadoPedido.IdPedido = (int)Current.Session["UltimoPedido"];
        //        pedidoEstadoPedido.IdEstadoPedido = (int)EstadoPedidoEntidad.Options.Finalizado;
        //        pedidoEstadoPedido.Fecha = DateTime.Now;

        //        unManagerPedido.FinalizarPedido(pedidoEstadoPedido);
                
        //        LimpiarPedido();
        //        //Response.Redirect("/Areas/Public/Forms/UltimosPedidos.aspx");
        //}

        [WebMethod]
        public static void CambiarTarjeta()
        {
           //REVISAR
            ////Cancelo el pedido, dps se vuelve a generar con la nueva tarjeta
            //var Current = HttpContext.Current;
            //string IdPedido = Current.Session["IdPedido"].ToString();

            //if (IdPedido != "")
            //{
            //    PedidoCore pedidoCore = new PedidoCore();
            //    PedidoEstadoPedidoEntidad EstadoActualizado = new PedidoEstadoPedidoEntidad();
            //    EstadoActualizado.IdPedido = Convert.ToInt32(IdPedido);
            //    EstadoActualizado.IdEstadoPedido = 2; //CANCELADO
            //    EstadoActualizado.Fecha = DateTime.Now;
            //    //REVISAR SI ES QUE SE PAGA CON CREDITO
            //    //pedidoCore.PedidoEstadoPedidoUpdate(EstadoActualizado);
            //}
            //var lista = (List<PedidoLista>)Current.Session["Pedido"];
            //foreach (var item in lista)
            //{
            //    StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
            //    NuevoStock.IdProducto = item.Producto.IdProducto;
            //    NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
            //    var sucursalId = (int?)Current.Session["Seleccionada"];
            //    NuevoStock.IdSucursal = (int)sucursalId;

            //    StockCore StockBLL = new StockCore();

            //    List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
            //    StockDeProducto = StockBLL.SelectByIdProducto(NuevoStock.IdProducto);



            //    if (StockDeProducto.Count > 0)
            //    {
            //        NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + item.Cantidad;
            //        StockBLL.Update(NuevoStock);
            //    }
            //}
           

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static bool PagarWebMethod()
        {
            ComprobanteEntidad unComprobante = new ComprobanteEntidad();
            unComprobante.Detalles = new List<ComprobanteDetalleEntidad>();
            ComprobanteCore unManagerComprobante = new ComprobanteCore();
            PedidoCore unManagerPedido = new PedidoCore();
            SucursalCore ManagerSucursal = new SucursalCore();
            int IdPedidoActual;

            List<PedidoDetalleEntidad> unosDetallesPedido = new List<PedidoDetalleEntidad>();
            var Current = HttpContext.Current;

            UsuarioEntidad logueado = (UsuarioEntidad)Current.Session["Usuario"];
            var sucursalId = (int?)Current.Session["Seleccionada"];
            IdPedidoActual = (int)Current.Session["UltimoPedido"];

            unosDetallesPedido = (List<PedidoDetalleEntidad>)Current.Session["DetallesPedido"];
            
            PedidoEntidad unPedidoPagar = new PedidoEntidad();
            unPedidoPagar = unManagerPedido.PedidoSelectByCUIT_IDPedido(IdPedidoActual);
            unPedidoPagar.misDetalles = unManagerPedido.PedidosDetalleSelect(unPedidoPagar.IdPedido);
            SucursalEntidad unaSucursal = ManagerSucursal.SucursalTraerPorDireccionSucursal(unPedidoPagar.miDireccionEntrega.IdDireccion);

            TarjetaEntidad unaTarjeta = new TarjetaEntidad();
            TarjetaCore coreTarjeta = new TarjetaCore();
            List<TarjetaEntidad> MisTarjetas = coreTarjeta.SelectAllTarjetasByCUIT_NombreUsuario(ConfigSection.Default.Site.Cuit, logueado.NombreUsuario);
            foreach (var t in MisTarjetas)
            {
                if (t.Predeterminada == true)
                {
                    unaTarjeta = t;
                }
            }

            if (unManagerPedido.PagarPedido(unaTarjeta.Numero.ToString(), unaTarjeta.CodSeguridad, (decimal)unPedidoPagar.misDetalles.Select(x => x.Cantidad * x.miProducto.PrecioUnitario).Sum()))
            {
                unManagerPedido.AvanzarPaso(unPedidoPagar, unaSucursal, logueado);
                LimpiarPedido();
                return true;
            }
            LimpiarPedido();
            return false;

            

            //Response.Redirect("/Areas/Public/Forms/UltimosPedidos.aspx");
        }



    }
}