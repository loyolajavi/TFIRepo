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
using System.Globalization;
using System.Threading;

namespace TFI.GUI
{
    public partial class Home : BasePage
    {

        
        List<ProductoEntidad> unosProductosDestacados = new List<ProductoEntidad>();
        List<ProductoEntidad> unosProductosMasVendidos = new List<ProductoEntidad>();
        HttpContext Current = HttpContext.Current;
        public UsuarioEntidad logueado = new UsuarioEntidad();
        private RecursoCore _coreRecurso = new RecursoCore();
        public List<String> listaRecursos;
        public MonedaEmpresaEntidad cotizacion;
        public MonedaEntidad moneda;
        private MonedaCore _coremoneda;
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
        [WebMethod]
        public decimal devolverCotizacion(string _cotizacion, string _cotizacion2)
        {
            var cotizacion = (MonedaEmpresaEntidad)HttpContext.Current.Session["Cotizacion"];
            cotizacion.Cotizacion = Convert.ToDecimal(_cotizacion);
            cotizacion.CUIT = _cotizacion2;
            return cotizacion.Cotizacion;
        }


        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}


        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            _coremoneda = new MonedaCore();
            cotizacion = new MonedaEmpresaEntidad();
            moneda = new MonedaEntidad();
            listaRecursos = CargarRecursos();
            ProductoCore unProductoCore = new ProductoCore();

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

                moneda = _coremoneda.selectMoneda(cotizacion.IdMoneda);
                // ProductoCore unProductoCore = new ProductoCore();
                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }

               


                //**************MOSTRAR PRODUCTOS DESTACADOS**********************************************************************
                //SI ESTA LOGUEADO
                //MUESTRA PRODUCTOS PRODUCTOS QUE ESTAN DENTRO DE LA MISMA CATEGORIA DE LOS ULTIMOS QUE COMPRO

                //SI NO
                //MUESTRA LOS ULTIMOS AGREGADOS AL ECOMMERCE
                unosProductosDestacados = (List<ProductoEntidad>)unProductoCore.FindAllByCUIT(cotizacion.IdMoneda).Where(o => o.FecBaja == null).OrderByDescending(x => x.IdProducto).Take(2).ToList();
                lstProductosDestacados.DataSource = unosProductosDestacados;
                lstProductosDestacados.DataBind();


                //**************MOSTRAR PRODUCTOS MAS VENDIDOS (PARA LA SEGUNDA PESTAÑA)**********************************************************************                
                unosProductosMasVendidos = unProductoCore.ProductoSelectMasVendidosByCUIT(ConfigSection.Default.Site.Cuit, cotizacion.IdMoneda).Where(o => o.FecBaja == null).ToList(); 
                lstMasVendidos.DataSource = unosProductosMasVendidos;
                lstMasVendidos.DataBind();
            }
            else
            {
                //Response.Redirect("LayoutBasico.aspx");
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;

                moneda = _coremoneda.selectMoneda(cotizacion.IdMoneda);
                unosProductosDestacados = (List<ProductoEntidad>)unProductoCore.FindAllByCUIT(cotizacion.IdMoneda).Where(o => o.FecBaja == null).OrderByDescending(x => x.IdProducto).Take(2).ToList();
                // var miDropMoneda = Master.combo.SelectedItem.Value;

                // Master.FindControl("DRWMoneda");
                lstProductosDestacados.DataSource = unosProductosDestacados;
                // cotizacion.Cotizacion = this.Master.cotizacion.Cotizacion;
                lstProductosDestacados.DataBind();
                unosProductosMasVendidos = unProductoCore.ProductoSelectMasVendidosByCUIT(ConfigSection.Default.Site.Cuit, cotizacion.IdMoneda).Where(o => o.FecBaja == null).ToList(); 
                lstMasVendidos.DataSource = unosProductosMasVendidos;
                lstMasVendidos.DataBind();

            }

            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();

            //pruebo lo de idioma para que quede seteado el combo cuando vuelve a home desde cualquier otra pagina

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
                //  lblIdioma.Items.FindByValue(CultureInfo.CurrentCulture.Name).Selected = true;
                //Thread.CurrentThread.CurrentCulture = new CultureInfo(idioma.DescripcionLenguaje);
                //Thread.CurrentThread.CurrentUICulture = new CultureInfo(idioma.DescripcionLenguaje);
            }

        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {

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

            var cotizacionStatic = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];
            //Guardar en BD el nuevo deseo
            if (unaListaDeseosCore.ListaDeseosInsert(unaListaDeseo) > 0)
            {
                //Agregar el deseo a la sesión actual
                ProductoEntidad unProductoEntidad = new ProductoEntidad();
                // unProductoEntidad = unProductoCore.Find(unaListaDeseo.IdProducto, 1);
                unProductoEntidad = unProductoCore.Find(unaListaDeseo.IdProducto, cotizacionStatic.IdMoneda);
                unaListaProductos.Add(unProductoEntidad);
                Current.Session["ListaDeseos"] = unaListaProductos;

            }

        }

        // NO LO USARIA MAS *************************************************00000000000000000000000000000000000000000000000000000000
        //protected void btnDesear_Click(object sender, EventArgs e)
        //{
        //    this.Master.ActualizarDeseos();
        //}

        protected List<string> CargarRecursos()
        {
            return _coreRecurso.SelectAll().Select(x => x.Url).ToList();

        }

        [WebMethod]
        public static List<String> ObtenerProductosEmpresa()
        {
            var cotizacion = (MonedaEmpresaEntidad)HttpContext.Current.Session["Cotizacion"];
            var core = new ProductoCore();


            // var pedidos = core.FindAllByCUIT();
            var pedidos = core.FindAllByCUIT(cotizacion.IdMoneda);

            return pedidos.Select(x => x.DescripProducto).ToList();


        }


        [WebMethod]
        public static List<String> ObtenerProductos()
        {
            var core = new ProductoCore();
            // var usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            var cotizacion = new MonedaEmpresaEntidad();
            cotizacion = (MonedaEmpresaEntidad)HttpContext.Current.Session["Cotizacion"];
            var cot2 = Convert.ToInt32(cotizacion.IdMoneda);
            var productosEmpresa = core.FindAllByCUIT(cot2).Where(o => o.FecBaja == null).ToList();

            return productosEmpresa.Select(x => x.DescripProducto).ToList();


        }





        [WebMethod]
        public static List<String> ObtenerProductosDeseos()
        {

            var template =
                "<li class=\"row drop-item\">" +
                        "<div class=\"col-md-4 drop-image-div \">" +
                            "<img src=\"/Content/Images/Productos/{0}\" class=\"img-responsive drop-image\"/> " +
                        "</div> " +
                        "<div style=\"word-wrap:normal;\" class=\"col-md-8\"><h6>{1}</h6></div> " +
                "</li>";

            var p = new List<String>();

            var productos = (List<ProductoEntidad>)HttpContext.Current.Session["ListaDeseos"];

            if (productos != null && productos.Any())
            {
                productos.ForEach(x => p.Add(string.Format(template, x.URL, x.DescripProducto)));
            }

            return p;
        }



    }//FIN CLASE
}