﻿using System;
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
    public partial class Catalogo : System.Web.UI.Page
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
            cotizacion = new MonedaEmpresaEntidad();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _coremoneda = new MonedaCore();
            moneda = new MonedaEntidad();
            if (!IsPostBack)
            {
                cotizacion = new MonedaEmpresaEntidad();
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];

                stringBusqueda = Page.Request.QueryString["search"];
                stringCategoria = Page.Request.QueryString["Categoria"];



                if (!string.IsNullOrEmpty(stringBusqueda))
                {

                    if (stringBusqueda == "*")
                    {
                        //unosProductos = _manager.ProductoSelectMasVendidosByCUIT(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);
                        unosProductos = _manager.FindAllByCUIT(cotizacion.IdMoneda);
                        catalogo.DataSource = unosProductos;
                        catalogo.DataBind();
                    }
                    else
                    {
                        var cotizacionStatic = new MonedaEmpresaEntidad();
                        cotizacionStatic = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];
                        //                      unosProductos = _manager.FindAllByDescripProducto(stringBusqueda);
                        unosProductos = _manager.FindAllByDescripProducto(stringBusqueda, cotizacionStatic.IdMoneda);
                        catalogo.DataSource = unosProductos;
                        catalogo.DataBind();
                    }
                }


                if (!string.IsNullOrEmpty(stringCategoria))
                {
                    if (Int32.Parse(stringCategoria) > 0 && Int32.Parse(stringCategoria) < 500)
                    {
                        unosProductos = _manager.ProductoSelectByCategoria(Int32.Parse(stringCategoria));
                        catalogo.DataSource = unosProductos;
                        catalogo.DataBind();
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
                moneda = _coremoneda.selectMoneda(cotizacion.IdMoneda);

            }

            else
            {
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;
            }
            //CargarCategorias

            unasCategorias = ManagerCategoria.SeleccionarCategorias();
            rptCategorias.DataSource = unasCategorias;
            rptCategorias.DataBind();
            //seteo el combo de moneda cuando refresco en el elegido sino se pierde
            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();


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

        // NO LO USARIA MAS ******************************************************0000000000000000000000000000000000000000000000000000000000000
        //protected void btnDesear_Click(object sender, EventArgs e)
        //{
        //    this.Master.ActualizarDeseos();
        //}
    }
}