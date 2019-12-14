using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;
using System.Web.Services;
using System.Web.Script.Services;
using TFI.SEGURIDAD;

namespace TFI.GUI
{
    public partial class ListaDeDeseos : BasePage
    {

        HttpContext Current = HttpContext.Current;
        public UsuarioEntidad logueado;
        public List<ProductoEntidad> unosProductosListaDeseo = new List<ProductoEntidad>();
        public static ProductoEntidad producto;
        private LenguajeEntidad idioma;
        public MonedaEntidad moneda;
        public MonedaEmpresaEntidad cotizacion;
        private MonedaCore _coreMoneda;

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
        public ListaDeDeseos()
        {
            idioma = new LenguajeEntidad();
            cotizacion = new MonedaEmpresaEntidad();
            _coreMoneda = new MonedaCore();
            moneda = new MonedaEntidad();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado == null)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            if (!IsPostBack)
            {
                cotizacion = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];

                idioma = (LenguajeEntidad)Session["Idioma"];

                if (cotizacion == null)
                {
                    cotizacion = new MonedaEmpresaEntidad();
                    cotizacion.IdMoneda = 1;
                    Current.Session["Cotizacion"] = cotizacion;
                }
                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);
                cotizacion = _coreMoneda.Select(cotizacion.IdMoneda);

                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }

            }
            else
            {
                idioma.DescripcionLenguaje = this.Master.obtenerIdiomaCombo();
                Current.Session["Idioma"] = idioma;
                cotizacion.IdMoneda = Convert.ToInt16(this.Master.obtenerValorDropDown());
                Current.Session["Cotizacion"] = cotizacion;
                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);
                cotizacion = _coreMoneda.Select(cotizacion.IdMoneda);
            }
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;

            }
            //if (!IsPostBack)
            //{
            //    cargarListaDeseos();
            //}
            //cargarListaDeseos();
        }

        
        [WebMethod]
        public static string ComprarProducto(string IdProdC)
        {
            var Current = HttpContext.Current;
            var manager = new ProductoCore();
            producto = manager.Find(Int32.Parse(IdProdC), 1);
            List<ProductoEntidad> ListaDeseo = new List<ProductoEntidad>();
            UsuarioEntidad logueadoStatic;
            
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            //var list = (List<ProductoEntidad>)Current.Session["ListaDeseos"];
            var list = (List<ProductoEntidad>)Current.Session["Productos"];

            if (logueadoStatic != null)
            {
                if (list == null || !list.Any())
                {
                    Current.Session["Productos"] = new List<ProductoEntidad>();
                    ((List<ProductoEntidad>)Current.Session["Productos"]).Add(producto);
                }
                else
                {
                    if (!list.Where(x => x.IdProducto == producto.IdProducto).Any())
                    {
                        ((List<ProductoEntidad>)Current.Session["Productos"]).Add(producto);
                    }
                    
                }


                //Quitar al producto de la lista de deseos (solo de SESSION), no así de la bd
                ListaDeseo = (List<ProductoEntidad>)Current.Session["ListaDeseos"];

                if (ListaDeseo != null || ListaDeseo.Any())
                {
                    ListaDeseo.RemoveAll(x => x.IdProducto == producto.IdProducto);
                    //Current.Session["ListaDeseos"] = new List<ProductoEntidad>();
                    Current.Session["ListaDeseos"] = ListaDeseo;
                }

                //Quitar al producto en BD de la lista de deseos
                ListaDeseosCore unListaDeseoCore = new ListaDeseosCore();
                ListaDeseoEntidad DeseoEliminar = new ListaDeseoEntidad();
                DeseoEliminar.IdProducto = producto.IdProducto;
                DeseoEliminar.NombreUsuario = logueadoStatic.NombreUsuario;
                unListaDeseoCore.ListaDeseosDelete(DeseoEliminar);

                
            }
            return producto.DescripProducto;
        }




        [WebMethod]
        public static void AgregarDeseo(string idProducto)
        {
            var Current = HttpContext.Current;
            var logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            List<ListaDeseoEntidad> listaDeseosSesion = new List<ListaDeseoEntidad>();
            List<ProductoEntidad> unaListaProductos = new List<ProductoEntidad>();
            ListaDeseosCore unaListaDeseosCore = new ListaDeseosCore();
            ListaDeseoEntidad unaListaDeseo = new ListaDeseoEntidad();
            ProductoCore unProductoCore = new ProductoCore();

            unaListaProductos = (List<ProductoEntidad>)Current.Session["ListaDeseos"];

            unaListaDeseo.CUIT = ConfigSection.Default.Site.Cuit;
            unaListaDeseo.NombreUsuario = logueadoStatic.NombreUsuario;
            unaListaDeseo.IdProducto = Int32.Parse(idProducto);

            //Guardar en BD el nuevo deseo
            if (unaListaDeseosCore.ListaDeseosInsert(unaListaDeseo) > 0)
            {
                //Agregar el deseo a la sesión actual
                ProductoEntidad unProductoEntidad = new ProductoEntidad();
                unProductoEntidad = unProductoCore.Find(unaListaDeseo.IdProducto,1);
                unaListaProductos.Add(unProductoEntidad);
                Current.Session["ListaDeseos"] = unaListaProductos;

            }

        }



        [WebMethod]
        public static List<String> ObtenerDeseosSession()
        {

            var Current = HttpContext.Current;
            MonedaEntidad moneda = new MonedaEntidad();
            MonedaCore _coreMoneda = new MonedaCore();
            MonedaEmpresaEntidad cotizacion = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];
            ProductoCore ManagerProducto = new ProductoCore();

             if (cotizacion == null)
                {
                    cotizacion = new MonedaEmpresaEntidad();
                    cotizacion.IdMoneda = 1;
                    Current.Session["Cotizacion"] = cotizacion;
                }
                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);

            var plantilla = 
                    "<tr class=\"{0}\">" +
                        "<td class=\"text-center\" style=\"padding: 7px;\">" + 
                            "<div class=\"img-thumbnail img-thumbnail-cart\">" + 
                                "<img class=\"img-responsive\" src=\"/Content/Images/Productos/{1}\" style=\"vertical-align: middle;\" />" + 
                            "</div>" + 
                        "</td>" + 
                        "<td class=\"product-descripcion\">" + 
                            "<h4>{2}</h4>" + 
                            "<small>SKU: {3}</small>" + 
                        "</td>" + 
                        "<td class=\"text-center\">" + 
                            "<p>" +
                                "<span>{4}</span> <span>{5}</span>" + 
                            "</p>" + 
                        "</td>" + 
                        "<td class=\"text-center\">" +
                                "<button class=\"btn btn-info\" id=\"btnComprar2\" data-producto2=\"{6}\" onclick=\"onBtnComprar(this)\">Comprar</button>" + 
                          "</td>" +
                        "<td class=\"text-center\">" +
                            "<button class=\"btn btn-danger\" id=\"btnEliminarDeseo\" data-prodeliminar=\"{7}\" onclick=\"onbtnEliminarDeseo(this)\">Eliminar</button>" +
                        "</td>" + 
                  "</tr>"; //FIN Plantilla

            var pl = new List<String>();

            List<ProductoEntidad> unosDeseos = (List<ProductoEntidad>)Current.Session["ListaDeseos"];
            List<ProductoEntidad> unosDeseosPrecioCalculo = new List<ProductoEntidad>();

            if (unosDeseos != null && unosDeseos.Any())
            {

                foreach (ProductoEntidad unDeseo in unosDeseos)
                {
                    unosDeseosPrecioCalculo.Add(ManagerProducto.Find(unDeseo.IdProducto, moneda.IdMoneda));
                }


                //foreach (ProductoEntidad unDeseo in unosDeseos)
                //{
                //    if (cotizacion.Cotizacion > 1)
                //        unDeseo.PrecioUnitario = System.Decimal.Round(unDeseo.PrecioUnitario / cotizacion.Cotizacion, 2);
                //    else
                //        unDeseo.PrecioUnitario = System.Decimal.Round(unDeseo.PrecioUnitario * cotizacion.Cotizacion, 2);
                //}

                unosDeseosPrecioCalculo.ForEach(x => pl.Add(string.Format(plantilla, x.IdProducto, x.URL, x.DescripProducto, x.CodigoProducto, moneda.SimboloMoneda, x.PrecioUnitario, x.IdProducto, x.IdProducto)));
            }

            return pl;

        }


        [WebMethod]
        public static void QuitarDeseo(string idProducto)
        {
            var Current = HttpContext.Current;
            var logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            //List<ListaDeseoEntidad> unosDeseos = new List<ListaDeseoEntidad>();
            List<ProductoEntidad> unosProdDeseados = new List<ProductoEntidad>();
            ListaDeseosCore ManagerDeseos = new ListaDeseosCore();
            ListaDeseoEntidad unaListaDeseo = new ListaDeseoEntidad();
            ProductoCore unProductoCore = new ProductoCore();

            //Quitar al producto de la lista de deseos (solo de SESSION), no así de la bd
            unosProdDeseados = (List<ProductoEntidad>)Current.Session["ListaDeseos"];

            if (unosProdDeseados != null || unosProdDeseados.Any())
            {
                unosProdDeseados.RemoveAll(x => x.IdProducto == Int32.Parse(idProducto));
                Current.Session["ListaDeseos"] = unosProdDeseados;
            }

            //Quitar al producto en BD de la lista de deseos
            ListaDeseoEntidad DeseoEliminar = new ListaDeseoEntidad();
            DeseoEliminar.IdProducto = Int32.Parse(idProducto);
            DeseoEliminar.NombreUsuario = logueadoStatic.NombreUsuario;
            ManagerDeseos.ListaDeseosDelete(DeseoEliminar);

        }

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
                if (logueado != null)
                    ServicioLog.CrearLog(es, "ConsultarStockWebMethod", logueado.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit);
                else
                    ServicioLog.CrearLog(es, "ConsultarStockWebMethod", "SIN_USUARIO", CORE.Helpers.ConfigSection.Default.Site.Cuit);
                throw;
            }
            return 0;
        }



    }
}