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

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                ProductoCore unProductoCore = new ProductoCore();

                var logueado = (UsuarioEntidad)Session["Usuario"];

//**************MOSTRAR PRODUCTOS DESTACADOS**********************************************************************
                //SI ESTA LOGUEADO
                    //MUESTRA PRODUCTOS PRODUCTOS QUE ESTAN DENTRO DE LA MISMA CATEGORIA DE LOS ULTIMOS QUE COMPRO

                //SI NO
                    //MUESTRA LOS ULTIMOS AGREGADOS AL ECOMMERCE



                if (logueado != null)
                {
                    //Agregar algun cod para lo del logueo??
                    Response.Write(logueado.Dni);
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
        public static void AddItem(string id)
        {
            var Current = HttpContext.Current;

            var prods = (List<Entidades.PedidoDetalleEntidad>)Current.Session["Producto"];

            if (prods == null)
                Current.Session["Producto"] = new List<Entidades.PedidoDetalleEntidad>();
            else
            {
                prods.Add(new Entidades.PedidoDetalleEntidad()
                {
                    Cantidad = 1,
                    IdPedido = Int32.Parse(id)
                });

                Current.Session["Producto"] = prods;
            }
        }


    }//FIN CLASE
}