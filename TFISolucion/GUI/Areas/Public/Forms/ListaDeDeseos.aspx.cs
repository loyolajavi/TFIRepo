using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;

namespace TFI.GUI
{
    public partial class ListaDeDeseos : System.Web.UI.Page
    {

        HttpContext Current = HttpContext.Current;
        public UsuarioEntidad logueado;
        public List<ProductoEntidad> unosProductosListaDeseo = new List<ProductoEntidad>();
        public static ProductoEntidad producto;

        protected void Page_Load(object sender, EventArgs e)
        {
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (!IsPostBack)
            {
                cargarListaDeseos();
            }
        }


        public static void ComprarProducto(string IdProdC)
        {
            var Current = HttpContext.Current;
            var manager = new ProductoCore();
            producto = manager.Find(Int32.Parse(IdProdC));
            List<ProductoEntidad> ListaDeseo = new List<ProductoEntidad>();

            var list = (List<ProductoEntidad>)Current.Session["ListaDeseo"];

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
            
            
            //Quitar al producto de la lista de deseos (solo de SESSION), no así de la bd
            ListaDeseo = (List<ProductoEntidad>)Current.Session["ListaDeseos"];
            ListaDeseo.RemoveAll(x => x.IdProducto == producto.IdProducto);


        }

        protected void btnComprarListaDeseos(object sender, EventArgs e)
        {
            unosProductosListaDeseo = (List<ProductoEntidad>)Current.Session["ListaDeseos"];
            cargarListaDeseos();
        }

        public void cargarListaDeseos()
        {
            unosProductosListaDeseo = (List<ProductoEntidad>)Current.Session["ListaDeseos"];
            lstProductos.DataSource = null;
            lstProductos.DataBind();
            lstProductos.DataSource = unosProductosListaDeseo;
            lstProductos.DataBind();
        }




    }
}