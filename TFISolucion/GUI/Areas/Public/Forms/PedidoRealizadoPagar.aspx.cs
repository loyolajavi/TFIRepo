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

namespace TFI.GUI.Areas.Public.Forms
    //namespace TFI.GUI
{
    public partial class PedidoRealizadoPagar : BasePage
    {
        public UsuarioEntidad logueado;
        public List<PedidoLista> lista = new List<PedidoLista>();
        public TarjetaEntidad MiTarjeta;
        public decimal totalizado;
        public int? FormaEntrega;
        public int? pedido;
        private LenguajeEntidad idioma;
        private string NroPedDUltPed = null;
        
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
        public PedidoRealizadoPagar()
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
            idioma = new LenguajeEntidad();
            PedidoCore ManagerPedido = new PedidoCore();
            PedidoEntidad unPedido = new PedidoEntidad();
            ProductoCore ManagerProducto = new ProductoCore();
            
            NroPedDUltPed = Page.Request.QueryString["NroPedDUltPed"];
            if (!string.IsNullOrEmpty(NroPedDUltPed))
                Current.Session["NroPedidoDesdeUltimosPedidos"] = NroPedDUltPed;
            else
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            
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

            unPedido = ManagerPedido.PedidoSelectByCUIT_NroPedido(Int64.Parse(NroPedDUltPed));
            unPedido.misDetalles = ManagerPedido.PedidosDetalleSelect(unPedido.IdPedido);
            MonedaEmpresaEntidad cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];
            foreach (PedidoDetalleEntidad unDet in unPedido.misDetalles)
            {
                unDet.miProducto = ManagerProducto.Find(unDet.miProducto.IdProducto, cotizacion.IdMoneda);
            }
            
            FormaEntrega = unPedido.miFormaEntrega.IdFormaEntrega;
            pedido = unPedido.IdPedido;
            totalizado = unPedido.misDetalles.Select(x => x.Cantidad * x.miProducto.PrecioUnitario).Sum();
            //TODO: sacarle el precio de envio hardcodeado:
            if (FormaEntrega != null && FormaEntrega == (int)FormaEntregaEntidad.Options.Correo)
                totalizado = totalizado + 100;


            unPedido.misDetalles.ForEach(x => lista.Add(new PedidoLista()
            {
                Cantidad = x.Cantidad,
                Producto = x.miProducto,
                Stock = true
            }));

            TarjetaCore coreTarjeta = new TarjetaCore();
            List<TarjetaEntidad> MisTarjetas = coreTarjeta.SelectAllTarjetasByCUIT_NombreUsuario(ConfigSection.Default.Site.Cuit, logueado.NombreUsuario);
            foreach(var t in MisTarjetas){
                if(t.Predeterminada == true){
                    MiTarjeta = t;
                }
            }
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
        public static void LimpiarPedido()
        {
            var Current = HttpContext.Current;
            Current.Session["Productos"] = null;
            Current.Session["UltimoPedido"] = null;
            Current.Session["Pedido"] = null;
            Current.Session["DetallesPedido"] = null;
        }

        [WebMethod]
        public static void CambiarTarjeta()
        {
         //REVISAR  
            //Cancelo el pedido, dps se vuelve a generar con la nueva tarjeta
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

        [WebMethod]
        public static void PagarWebMethod()
        {
            //Obtener NroPedido seleccionado
            var Current = HttpContext.Current;
            Int64 unNroPedido = Int64.Parse(Current.Session["NroPedidoDesdeUltimosPedidos"].ToString());
            //Preparar variables para generar factura
            PedidoCore unManagerPedido = new PedidoCore();
            PedidoEntidad unPedidoPagar = new PedidoEntidad();
            SucursalCore ManagerSucursal = new SucursalCore();
            UsuarioEntidad logueado = new UsuarioEntidad();

            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            unPedidoPagar = unManagerPedido.PedidoSelectByCUIT_NroPedido(unNroPedido);
            unPedidoPagar.misDetalles = unManagerPedido.PedidosDetalleSelect(unPedidoPagar.IdPedido);
            SucursalEntidad unaSucursal = ManagerSucursal.SucursalTraerPorDireccionSucursal(unPedidoPagar.miDireccionEntrega.IdDireccion);
            
            unManagerPedido.AvanzarPaso(unPedidoPagar, unaSucursal, logueado);
            //LimpiarPedido();
        }



    }
}