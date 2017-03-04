using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI
{
    public partial class Catalogo : BasePage
    {
        private ProductoCore _manager;
        public static ProductoEntidad producto;
        private CategoriaCore ManagerCategoria = new CategoriaCore();
        HttpContext Current = HttpContext.Current;

        private string stringBusqueda = null;
        private string stringCategoria = null;
        private List<ProductoEntidad> unosProductos = new List<ProductoEntidad>();
        private List<CategoriaEntidad> unasCategorias = new List<CategoriaEntidad>();
        private MonedaEmpresaEntidad cotizacion;
        private MonedaCore _coremoneda;
        public MonedaEntidad moneda;
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

        public Catalogo()
        {
            _manager = new ProductoCore();
            moneda = new MonedaEntidad();
            _coremoneda = new MonedaCore();
            _manager = new ProductoCore();
            cotizacion = new MonedaEmpresaEntidad();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();

            if (!IsPostBack)
            {
                cargarFiltros();

                idioma = (LenguajeEntidad)Session["Idioma"];
                cotizacion = new MonedaEmpresaEntidad();
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];

                stringBusqueda = Page.Request.QueryString["search"];
                stringCategoria = Page.Request.QueryString["Categoria"];
                Session.Add("ProductosEnSesion", unosProductos);

                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }

                if (!string.IsNullOrEmpty(stringBusqueda))
                {

                    if (stringBusqueda == "*")
                    {
                        //unosProductos = _manager.ProductoSelectMasVendidosByCUIT(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);
                        unosProductos = _manager.FindAllByCUIT(cotizacion.IdMoneda);
                        catalogo.DataSource = unosProductos;
                        catalogo.DataBind();
                        Session["ProductosEnSesion"] = unosProductos;
                    }
                    else
                    {
                        var cotizacionStatic = new MonedaEmpresaEntidad();
                        cotizacionStatic = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];
                        //                      unosProductos = _manager.FindAllByDescripProducto(stringBusqueda);
                        unosProductos = _manager.FindAllByDescripProducto(stringBusqueda, cotizacionStatic.IdMoneda);
                        catalogo.DataSource = unosProductos;
                        catalogo.DataBind();
                        Session["ProductosEnSesion"] = unosProductos;
                    }
                }


                if (!string.IsNullOrEmpty(stringCategoria))
                {
                    if (Int32.Parse(stringCategoria) > 0 && Int32.Parse(stringCategoria) < 500)
                    {
                        unosProductos = _manager.ProductoSelectByCategoria(Int32.Parse(stringCategoria), cotizacion.IdMoneda);
                        catalogo.DataSource = unosProductos;
                        catalogo.DataBind();
                        Session["ProductosEnSesion"] = unosProductos;
                    }
                    else
                    {
                        notif.Attributes.Remove("hidden");
                        notif.InnerHtml = string.Format("<span>{0}</span>", "No existe la categoría ingresada");
                    }
                }



                if (!unosProductos.Any())
                {
                    notif.Attributes.Remove("hidden");
                    notif.InnerHtml = string.Format("<span>{0}</span>", "No se encontraron productos, por favor realice otra búsqueda");
                }


            }

            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                unosProductos = (List<ProductoEntidad>)Session["ProductosEnSesion"];
                cotizacion = _coremoneda.Select(cotizacion.IdMoneda);
                Session["Cotizacion"] = cotizacion;
                foreach (var item in unosProductos)
                {
                    var item2 = _manager.Find(item.IdProducto, cotizacion.IdMoneda);
                    //if (cotizacion.Cotizacion >1)
                    //{
                    //    item.PrecioUnitario = item2.PrecioUnitario / cotizacion.Cotizacion;
                    //}
                    //else
                    //{ item.PrecioUnitario = item2.PrecioUnitario * cotizacion.Cotizacion; }
                    item.PrecioUnitario = decimal.Round(item2.PrecioUnitario, 2);

                }
                catalogo.DataSource = unosProductos;
                catalogo.DataBind();



            }
            moneda = _coremoneda.selectMoneda(cotizacion.IdMoneda);
            //CargarCategorias

            unasCategorias = ManagerCategoria.SeleccionarCategorias();
            rptCategorias.DataSource = unasCategorias;
            rptCategorias.DataBind();
            //seteo el combo de moneda cuando refresco en el elegido sino se pierde
            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
                //  lblIdioma.Items.FindByValue(CultureInfo.CurrentCulture.Name).Selected = true;
                //Thread.CurrentThread.CurrentCulture = new CultureInfo(idioma.DescripcionLenguaje);
                //Thread.CurrentThread.CurrentUICulture = new CultureInfo(idioma.DescripcionLenguaje);
            }
           if( lblStatus != null)
                lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();

           var valordropdown = Session["ValorDrop"];
           if (valordropdown != null) {
               if (Convert.ToInt32(valordropdown) == 0)
           {
               catalogo.DataSource = unosProductos.OrderByDescending(x => x.PrecioUnitario);;
               catalogo.DataBind();
           }
            else if (Convert.ToInt32(valordropdown) == 1)
           {
               catalogo.DataSource = unosProductos.OrderBy(x => x.PrecioUnitario);;
               catalogo.DataBind();
           }
               else if (Convert.ToInt32(valordropdown) == 2)
               {
                   catalogo.DataSource = unosProductos.OrderByDescending(x => x.DescripProducto); ;
                   catalogo.DataBind();
               }
               else if (Convert.ToInt32(valordropdown) == 3)
               {
                   catalogo.DataSource = unosProductos.OrderBy(x => x.DescripProducto); ;
                   catalogo.DataBind();
               } 
           }

        }

        public void cargarFiltros()
        {
           var valordropdown = Session["ValorDrop"];
        
               dropdownfiltro.Items.Add("Mayor Precio");
               dropdownfiltro.Items.Add("Menor Precio");
               dropdownfiltro.Items.Add("Z - A");
               dropdownfiltro.Items.Add("A - Z");
               dropdownfiltro.DataBind();
               if (valordropdown != null)
               {
                   if (Convert.ToInt32(valordropdown) == 0) { dropdownfiltro.SelectedIndex = 0; }
                   else if (Convert.ToInt32(valordropdown) == 1) { dropdownfiltro.SelectedIndex = 1; }
                   else if (Convert.ToInt32(valordropdown) == 2) { dropdownfiltro.SelectedIndex = 2; }
                   else if (Convert.ToInt32(valordropdown) == 3) { dropdownfiltro.SelectedIndex = 3; }
               }
        }

        [WebMethod]
        public static string AgregarItem(string id)
        {
            var Current = HttpContext.Current;
            var manager = new ProductoCore();
            var cotizacionStatic = new MonedaEmpresaEntidad();
            cotizacionStatic = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];
            producto = manager.Find(Int32.Parse(id), cotizacionStatic.IdMoneda);

            var list = (List<ProductoEntidad>)Current.Session["Productos"];

            if (list == null || !list.Any())
            {
                Current.Session["Productos"] = new List<ProductoEntidad>();
                ((List<ProductoEntidad>)Current.Session["Productos"]).Add(producto);
            }
            else
            {
                if (!list.Where(x => x.IdProducto == producto.IdProducto).Any())
                    ((List<ProductoEntidad>)Current.Session["Productos"]).Add(producto);
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

            unaListaDeseo.CUIT = logueadoStatic.CUIT;
            unaListaDeseo.NombreUsuario = logueadoStatic.NombreUsuario;
            unaListaDeseo.IdProducto = Int32.Parse(idProducto);
            var cotizacion = new MonedaEmpresaEntidad();
            cotizacion = (MonedaEmpresaEntidad)Current.Session["Productos"];
            //Guardar en BD el nuevo deseo
            if (unaListaDeseosCore.ListaDeseosInsert(unaListaDeseo) > 0)
            {
                //Agregar el deseo a la sesión actual
                //List<ListaDeseoEntidad> unasListaDeseoEntidad = new List<ListaDeseoEntidad>();
                //unasListaDeseoEntidad = unaListaDeseosCore.ListaDeseosSelectAllByCUIT_NombreUsuario(logueadoStatic.NombreUsuario);

                //foreach (var item in unasListaDeseoEntidad)
                //{
                ProductoEntidad unProductoEntidad = new ProductoEntidad();
                unProductoEntidad = unProductoCore.Find(unaListaDeseo.IdProducto, 1);
                unaListaProductos.Add(unProductoEntidad);
                //}
                //listaDeseosSesion.Add(unaListaDeseo);
                Current.Session["ListaDeseos"] = unaListaProductos;
                //ActualizarDeseos();
            }
        }

        protected void dropdownfiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dropdownfiltro.SelectedIndex == 0)
            {
                catalogo.DataSource = unosProductos.OrderByDescending(x => x.PrecioUnitario);
                catalogo.DataBind();
            }
            else if (dropdownfiltro.SelectedIndex == 1)
            {
                catalogo.DataSource = unosProductos.OrderBy(x => x.PrecioUnitario);
                catalogo.DataBind();
            }
            else if (dropdownfiltro.SelectedIndex == 2)
            {
                catalogo.DataSource = unosProductos.OrderByDescending(x => x.DescripProducto); 
                catalogo.DataBind();
            }
            else if (dropdownfiltro.SelectedIndex == 3)
            {
                catalogo.DataSource = unosProductos.OrderBy(x => x.DescripProducto); 
                catalogo.DataBind();
            }
            
            
            Session["ValorDrop"] = dropdownfiltro.SelectedIndex;
            Response.Redirect(Request.RawUrl);
        }

        // NO LO USARIA MAS ******************************************************0000000000000000000000000000000000000000000000000000000000000
        //protected void btnDesear_Click(object sender, EventArgs e)
        //{
        //    this.Master.ActualizarDeseos();
        //}
    }
}