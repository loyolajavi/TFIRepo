using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;

namespace TFI.GUI
{
    public partial class Home : System.Web.UI.Page
    {

        //string stringBusqueda = null;
        List<ProductoEntidad> unosProductosDestacados = new List<ProductoEntidad>();
        List<ProductoEntidad> unosProductosMasVendidos = new List<ProductoEntidad>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //stringBusqueda = Page.Request.QueryString["search"];
            }


                ProductoCore unProductoCore = new ProductoCore();
                unosProductosDestacados = unProductoCore.FindAllByCUIT("20112223331");

                lstProductosDestacados.DataSource = unosProductosDestacados;
                lstProductosDestacados.DataBind();

                unosProductosMasVendidos = unProductoCore.FindAllByCUIT("123456");
                lstMasVendidos.DataSource = unosProductosMasVendidos;
                lstMasVendidos.DataBind();
            

        }
    }
}