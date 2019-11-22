using System;
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
    public partial class ClientesEmpresa : BasePage
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
        private LenguajeEntidad idioma;

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
        public ClientesEmpresa()
        {
            idioma = new LenguajeEntidad();
        }

        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            listaEmpresas = usuarioBLL.EmpresasConMasPedidos(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);
            if (!IsPostBack)
            {

                idioma = (LenguajeEntidad)Session["Idioma"];

                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }

            }
            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;

            }
            //**************MOSTRAR LAS 5 EMPRESAS CON MAS PEDIDOS FINALIZADOS DE CADA EMPRESA (PARA LA SEGUNDA PESTAÑA)**********************************************************************                
            //unosProductosMasVendidos = unProductoCore.ProductoSelectMasVendidosByCUIT(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);
            lstClientesConMasCompras.DataSource = listaEmpresas;
            lstClientesConMasCompras.DataBind();
        }
    }
}