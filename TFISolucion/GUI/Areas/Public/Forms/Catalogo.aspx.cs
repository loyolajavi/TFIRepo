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
                
                ((List<ProductoEntidad>)Current.Session["Productos"]).Add(producto);
            }
            return producto.CodigoProducto;
        }
    }
}