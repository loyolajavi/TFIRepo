using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE;
using TFI.CORE.Managers;

namespace TFI.GUI
{
    public partial class CatalogoPrinc : System.Web.UI.Page
    {
        
        string stringBusqueda = null;
        List<ProductoEntidad> unProducto = new List<ProductoEntidad>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                stringBusqueda = Page.Request.QueryString["search"];
            }


            if (!string.IsNullOrEmpty(stringBusqueda))
            {
                ProductoCore unProductoCore = new ProductoCore();
                Response.Write(stringBusqueda); //Esta para verq ingrese facilmente, DPS BORRARLO
                unProducto = unProductoCore.FindAllByDescripProducto(stringBusqueda);

                Response.Write(unProducto);

            }
            

        }

    }
}
