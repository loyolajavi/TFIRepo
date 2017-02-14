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

namespace TFI.GUI
{
    public partial class ListaDeDeseos : BasePage
    {

        HttpContext Current = HttpContext.Current;
        public UsuarioEntidad logueado;
        public List<ProductoEntidad> unosProductosListaDeseo = new List<ProductoEntidad>();
        public static ProductoEntidad producto;

        protected void Page_Load(object sender, EventArgs e)
        {
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado == null)
            {
                Response.Redirect("Home.aspx");
            }

            if (!IsPostBack)
            {
                cargarListaDeseos();
            }
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

        protected void ComprarListaDeseos(object sender, EventArgs e)
        {
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

        //protected void btnDesear_Click(object sender, EventArgs e)
        //{
        //    this.Master.ActualizarDeseos();
        //}


        

    }
}