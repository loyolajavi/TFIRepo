using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI
{
    public partial class Catalogo : System.Web.UI.Page
    {
        private ProductoCore _manager;
        public static ProductoEntidad producto;
        HttpContext Current = HttpContext.Current;

        private string stringBusqueda = null;
        private List<ProductoEntidad> unosProductos = new List<ProductoEntidad>();

        public Catalogo()
        {
            _manager = new ProductoCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                stringBusqueda = Page.Request.QueryString["search"];
            }

            if (!string.IsNullOrEmpty(stringBusqueda))
            {
                unosProductos = _manager.FindAllByDescripProducto(stringBusqueda);

                catalogo.DataSource = unosProductos;
                catalogo.DataBind();
            }

            if (!unosProductos.Any())
            {
                notif.Attributes.Remove("hidden");
                notif.InnerHtml = string.Format("<span>{0}</span>", "No hay productos que coincidan con la busqueda");
            }
        }

        [WebMethod]
        public static string AgregarItem(string id)
        {
            var Current = HttpContext.Current;
            var manager = new ProductoCore();
            producto = manager.Find(Int32.Parse(id));

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

            //Guardar en BD el nuevo deseo
            if (unaListaDeseosCore.ListaDeseosInsert(unaListaDeseo) > 0)
            {
                //Agregar el deseo a la sesión actual
                //List<ListaDeseoEntidad> unasListaDeseoEntidad = new List<ListaDeseoEntidad>();
                //unasListaDeseoEntidad = unaListaDeseosCore.ListaDeseosSelectAllByCUIT_NombreUsuario(logueadoStatic.NombreUsuario);

                //foreach (var item in unasListaDeseoEntidad)
                //{
                ProductoEntidad unProductoEntidad = new ProductoEntidad();
                unProductoEntidad = unProductoCore.Find(unaListaDeseo.IdProducto);
                unaListaProductos.Add(unProductoEntidad);
                //}
                //listaDeseosSesion.Add(unaListaDeseo);
                Current.Session["ListaDeseos"] = unaListaProductos;
                //ActualizarDeseos();
            }
        }

        protected void btnDesear_Click(object sender, EventArgs e)
        {
            this.Master.ActualizarDeseos();
        }
    }
}