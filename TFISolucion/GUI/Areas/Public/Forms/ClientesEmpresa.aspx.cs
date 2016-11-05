using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI
{
    public partial class ClientesEmpresa : System.Web.UI.Page
    {
        // SOLO FUNCIONA BUSCAR PRODUCTOS PORQUE ESTA HARDCODEADO EL CUIT EN EL WEB CONFIG
        List<ProductoEntidad> unosProductosDestacados = new List<ProductoEntidad>();
        List<ProductoEntidad> unosProductosMasVendidos = new List<ProductoEntidad>();
        ListaDeseoEntidad unaListaDeseos;
        HttpContext Current = HttpContext.Current;

        //instancio lista de usuario entidad para empresas
        List<UsuarioEntidad> listaEmpresas = new List<UsuarioEntidad>();

        //instancio  manager
        UsuarioCore usuarioBLL = new UsuarioCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            listaEmpresas = usuarioBLL.EmpresasConMasPedidos(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);


            //**************MOSTRAR LAS 5 EMPRESAS CON MAS PEDIDOS FINALIZADOS DE CADA EMPRESA (PARA LA SEGUNDA PESTAÑA)**********************************************************************                
            //unosProductosMasVendidos = unProductoCore.ProductoSelectMasVendidosByCUIT(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);
            lstClientesConMasCompras.DataSource = listaEmpresas;
            lstClientesConMasCompras.DataBind();
        }
    }
}