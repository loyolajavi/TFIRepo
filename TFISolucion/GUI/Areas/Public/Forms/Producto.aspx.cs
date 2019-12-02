using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.SEGURIDAD;

namespace TFI.GUI
{
    public partial class Producto : BasePage
    {
        private ProductoCore _manager;
        public const string IMAGES_CONTAINER = "/Content/Images/Productos/";
        private int _IdProducto;
        protected ProductoEntidad producto;
        public MonedaEmpresaEntidad cotizacion;
        public MonedaEntidad moneda;
        private MonedaCore _coreMoneda;
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
        public Producto()
        {
            cotizacion = new MonedaEmpresaEntidad();
            moneda = new MonedaEntidad();
            _coreMoneda = new MonedaCore();
            _manager = new ProductoCore();
            idioma = new LenguajeEntidad();

        }

        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}


        protected void Page_Load(object sender, EventArgs e)
        {
            //idioma = new LenguajeEntidad();
            int IdProducto = Convert.ToInt32(Request.QueryString["IdProducto"]);
            _IdProducto = IdProducto;
            IdProductoComprarServer.Value = IdProducto.ToString();
            if (!IsPostBack)
            {
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];

                idioma = (LenguajeEntidad)Session["Idioma"];
                if (cotizacion == null)
                {
                    cotizacion = new MonedaEmpresaEntidad();
                    cotizacion.IdMoneda = 1;
                    Session["Cotizacion"] = cotizacion;
                }

                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);

                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }

            }
            else
            {
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }
            if (cotizacion == null)
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
            producto = _manager.Find(IdProducto, cotizacion.IdMoneda);
            moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);
            Page.Title = producto.DescripProducto;
            

            LoadProducto(IdProducto);
            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
                
            }
        }

        private void LoadProducto(int IdProducto)
        {
            imgProducto.Attributes["src"] = string.Format("{0}{1}", IMAGES_CONTAINER, producto.URL);
        }

        //protected void btnComprar_ServerClick(object sender, EventArgs e)
        //{
        //    if (Session["Usuario"] != null)
        //    {
        //        UsuarioEntidad oUsuario = new UsuarioEntidad();
        //        oUsuario = (UsuarioEntidad)Session["Usuario"];
        //        HelperProductoCantidad hProductoCantidad = new HelperProductoCantidad();
        //        ProductoEntidad oProducto = new ProductoEntidad();
        //        oProducto.IdProducto = _IdProducto;
        //        //oProducto.PrecioUnitario = Convert.ToDecimal(lblPrecio.InnerText);
        //        //hProductoCantidad.Cantidad = Convert.ToInt32(sCantidad.Value);
        //        hProductoCantidad.Producto = oProducto;
        //        List<HelperProductoCantidad> lProducto = new List<HelperProductoCantidad>();
        //        lProducto.Add(hProductoCantidad);
        //        PedidoCore PedidoCore = new PedidoCore();
        //        PedidoCore.InsertSelect(lProducto, oUsuario, DateTime.Now, "alem 123");
        //    }
        //    else
        //    {
        //        //no puede comprar, debe estar registrado y haber iniciado sesion
        //    }
        //}

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static int consultarStock(int id)
        {
            StockCore _coreStock = new StockCore();

            try
            {
                List<StockSucursalEntidad> Stocks = _coreStock.SelectByIdProducto(id);
                int StockAcumulado = 0;
                if (Stocks.Count > 0)
                {
                    foreach (var stockdeproducto in Stocks)
                    {
                        StockAcumulado = StockAcumulado + stockdeproducto.CantidadProducto;
                    }
                    return StockAcumulado;
                }
            }
            catch (Exception es)
            {
                UsuarioEntidad logueado = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
                if(logueado != null)
                    ServicioLog.CrearLog(es, "ConsultarStockWebMethod", logueado.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit);
                else
                    ServicioLog.CrearLog(es, "ConsultarStockWebMethod", "SIN_USUARIO", CORE.Helpers.ConfigSection.Default.Site.Cuit);
                throw;
            }
            return 0;
        }

    }
}