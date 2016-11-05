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

        protected void Page_Load(object sender, EventArgs e)
        {
             logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (!IsPostBack)
            {

                
                unosProductosListaDeseo = (List<ProductoEntidad>)Current.Session["ListaDeseos"]; 

                


                //ProductoCore unProductoCore = new ProductoCore();
                //unosProductosListaDeseo = unProductoCore.ProductoSelectMasVendidosByCUIT(ConfigSection.Default.Site.Cuit);
                //rptProductosListaDeseo.DataSource = unosProductosListaDeseo;
                //rptProductosListaDeseo.DataBind();
            }
        }
    }
}