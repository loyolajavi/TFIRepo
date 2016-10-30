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
        UsuarioEntidad logueado;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (!IsPostBack)
            {

                ProductoCore unProductoCore = new ProductoCore();

                //var logueado = (UsuarioEntidad)Session["Usuario"];

//**************MOSTRAR PRODUCTOS DESTACADOS**********************************************************************
                //SI ESTA LOGUEADO
                    //MUESTRA PRODUCTOS PRODUCTOS QUE ESTAN DENTRO DE LA MISMA CATEGORIA DE LOS ULTIMOS QUE COMPRO

                //SI NO
                    //MUESTRA LOS ULTIMOS AGREGADOS AL ECOMMERCE



                if (logueado != null)
                {
                    //Agregar algun cod para lo del logueo??
                    Response.Write(logueado.NroIdentificacion);
                }
                else
                {
                    unosProductosDestacados = (List<ProductoEntidad>)unProductoCore.FindAllByCUIT(ConfigSection.Default.Site.Cuit).OrderByDescending(x => x.IdProducto).Take(2).ToList();
                }

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
            
        }

        [WebMethod]
        public static void AgregarDeseo(string idProducto)
        {
            var Current = HttpContext.Current;

            var PedDetalle = (List<Entidades.PedidoDetalleEntidad>)Current.Session["PedidoDetalle"];

            if (PedDetalle == null)
                Current.Session["PedidoDetalle"] = new List<Entidades.PedidoDetalleEntidad>();
            else
            {
                PedDetalle.Add(new Entidades.PedidoDetalleEntidad()
                {
                    Cantidad = 1,
                    IdProducto = Int32.Parse(idProducto)
                });


                Current.Session["PedidoDetalle"] = PedDetalle;
            }
        }


        //SI ESTA LOGUEADO HACE ESTO
        public void AgregarDeseo(int idProd)
        {
            ListaDeseosCore unaListaDeseosCore = new ListaDeseosCore();
            ListaDeseosDetalleCore unaListaDeseosDetalleCore = new ListaDeseosDetalleCore();
            
            if (unaListaDeseosCore.ListaDeseosSelectAllByCUIT_NombreUsuario(logueado.NombreUsuario).FirstOrDefault() == null)
            {
                unaListaDeseos = new ListaDeseoEntidad();
                unaListaDeseos.CUIT = ConfigSection.Default.Site.Cuit;
                unaListaDeseos.NombreUsuario = logueado.NombreUsuario;

                int IdLista;
                IdLista = unaListaDeseosCore.ListaDeseosInsert(unaListaDeseos);

                if (IdLista > 0)
                {
                    unosDetallesListaDeseos = new List<ListaDeseosDetalleEntidad>();
                    var PedDetalle = (List<Entidades.PedidoDetalleEntidad>)Current.Session["PedidoDetalle"];
                    foreach (var prod in PedDetalle)
                    {
                        unDetalleListaDeseos = new ListaDeseosDetalleEntidad();
                        unDetalleListaDeseos.IdListaDeseos = IdLista;
                        unDetalleListaDeseos.IdProducto = prod.IdProducto;
                        unDetalleListaDeseos.CUIT = unaListaDeseos.CUIT;
                        unDetalleListaDeseos.FechaDeseoDetalle = DateTime.Now.Date;
                        unosDetallesListaDeseos.Add(unDetalleListaDeseos);
                    }

                    unaListaDeseosDetalleCore.ListaDeseosDetalleInsert(unosDetallesListaDeseos);


                }
            }
            
        }

        public void AgregarProductoListaDeseos()
        {

        }





    }//FIN CLASE
}