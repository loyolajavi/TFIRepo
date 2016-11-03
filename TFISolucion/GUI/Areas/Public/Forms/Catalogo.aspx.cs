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
        HttpContext Current = HttpContext.Current;
        public UsuarioEntidad logueado;
        

        string stringBusqueda = null;
        List<ProductoEntidad> unosProductos = new List<ProductoEntidad>();



        public Catalogo()
        {
            _manager = new ProductoCore();
        }


        
        protected void Page_Load(object sender, EventArgs e)
        {

            logueado = (UsuarioEntidad)Current.Session["Usuario"];


             if (logueado != null)
            {
                this.Master.IngresoDeUsuario = false;
                this.Master.SetUsuarioLogueado(logueado.Nombre + " " + logueado.Apellido);
                this.Master.MostrarPedido = true;
                this.Master.MostrarDropDeseos = true;
                //this.Master.ActualizarPedido();
                this.Master.ActualizarDeseos();
            }





            //if (!IsPostBack)
            //{
            //    stringBusqueda = Page.Request.QueryString["search"];
            //}


            //if (!string.IsNullOrEmpty(stringBusqueda))
            //{
            //    ProductoCore unProductoCore = new ProductoCore();
            //    //Response.Write(stringBusqueda); //Esta para verq ingrese facilmente, DPS BORRARLO
            //    unosProductos = unProductoCore.FindAllByDescripProducto(stringBusqueda);

            //    catalogo.DataSource = unosProductos;
            //    catalogo.DataBind();


            //}
            

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
