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
    public partial class Home : System.Web.UI.Page
    {

        //SOLO FUNCIONA BUSCAR PRODUCTOS PORQUE ESTA HARDCODEADO EL CUIT EN EL WEB CONFIG
        List<ProductoEntidad> unosProductosDestacados = new List<ProductoEntidad>();
        List<ProductoEntidad> unosProductosMasVendidos = new List<ProductoEntidad>();
        ListaDeseoEntidad unaListaDeseos;
        List<ListaDeseosDetalleEntidad> unosDetallesListaDeseos;
        ListaDeseosDetalleEntidad unDetalleListaDeseos;
        HttpContext Current = HttpContext.Current;
        public UsuarioEntidad logueado;
        

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


            if (!IsPostBack)
            {

                ProductoCore unProductoCore = new ProductoCore();


//**************MOSTRAR PRODUCTOS DESTACADOS**********************************************************************
                //SI ESTA LOGUEADO
                    //MUESTRA PRODUCTOS PRODUCTOS QUE ESTAN DENTRO DE LA MISMA CATEGORIA DE LOS ULTIMOS QUE COMPRO

                //SI NO
                    //MUESTRA LOS ULTIMOS AGREGADOS AL ECOMMERCE


                
                //if (logueado != null)
                //{
                    
                //}
                //else
                //{
                    unosProductosDestacados = (List<ProductoEntidad>)unProductoCore.FindAllByCUIT(ConfigSection.Default.Site.Cuit).OrderByDescending(x => x.IdProducto).Take(2).ToList();
                //}

                lstProductosDestacados.DataSource = unosProductosDestacados;
                lstProductosDestacados.DataBind();


//**************MOSTRAR PRODUCTOS MAS VENDIDOS (PARA LA SEGUNDA PESTAÑA)**********************************************************************                
                unosProductosMasVendidos = unProductoCore.ProductoSelectMasVendidosByCUIT(ConfigSection.Default.Site.Cuit);
                lstMasVendidos.DataSource = unosProductosMasVendidos;
                lstMasVendidos.DataBind();
            }

        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            //******************************************************************
            //CODIGO PARA MOSTRAR LO AGREGADO A LA LISTA DE DESEOS, DPS BORRAR
            var Current = HttpContext.Current;
            List<ListaDeseoEntidad> ListaDeseosSesion = new List<ListaDeseoEntidad>();

            ListaDeseosSesion = (List<ListaDeseoEntidad>)Current.Session["ListaDeseos"];
            foreach (var item in ListaDeseosSesion)
            {
                Response.Write(item.IdProducto);
            }
            //*************************************************************
        }

        [WebMethod]
        public static void AgregarDeseo(string idProducto)
        {
            var Current = HttpContext.Current;
            var logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            List<ListaDeseoEntidad> listaDeseosSesion = new List<ListaDeseoEntidad>();
            ListaDeseosCore unaListaDeseosCore = new ListaDeseosCore();
            ListaDeseoEntidad unaListaDeseo = new ListaDeseoEntidad();

            listaDeseosSesion = (List<ListaDeseoEntidad>)Current.Session["ListaDeseos"];

            unaListaDeseo.CUIT = ConfigSection.Default.Site.Cuit;
            unaListaDeseo.NombreUsuario = logueadoStatic.NombreUsuario;
            unaListaDeseo.IdProducto = Int32.Parse(idProducto);

            //Guardar en BD el nuevo deseo
            if (unaListaDeseosCore.ListaDeseosInsert(unaListaDeseo) > 0)
            {
                //Agregar el deseo a la sesión actual
                listaDeseosSesion.Add(unaListaDeseo);
                Current.Session["ListaDeseos"] = listaDeseosSesion;
            }

        }
        



    }//FIN CLASE
}