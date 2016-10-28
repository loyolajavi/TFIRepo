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
                unosProductosDestacados = unProductoCore.FindAllByCUIT(ConfigSection.Default.Site.Cuit);

                lstProductosDestacados.DataSource = unosProductosDestacados;
                lstProductosDestacados.DataBind();

                unosProductosMasVendidos = unProductoCore.FindAllByCUIT("123456");
                lstMasVendidos.DataSource = unosProductosMasVendidos;
                lstMasVendidos.DataBind();
            }

        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {

        }
    }
}