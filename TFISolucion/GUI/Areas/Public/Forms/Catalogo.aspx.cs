using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using TFI.Entidades;
using TFI.CORE;
using TFI.CORE.Managers;
using System.Linq;

namespace TFI.GUI
{
    public partial class Catalogo : System.Web.UI.Page
    {

        private ProductoCore _manager;
        public static ProductoEntidad producto;
        
        string stringBusqueda = null;
        List<ProductoEntidad> unosProductos = new List<ProductoEntidad>();



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
                ProductoCore unProductoCore = new ProductoCore();
                //Response.Write(stringBusqueda); //Esta para verq ingrese facilmente, DPS BORRARLO
                unosProductos = unProductoCore.FindAllByDescripProducto(stringBusqueda);

                catalogo.DataSource = unosProductos;
                catalogo.DataBind();


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

            Current.Session["Actual"] = producto;

            return producto.CodigoProducto;
        }



    }
}
