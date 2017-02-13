using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.UI.WebControls;
using TFI.CORE.Helpers;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.FUNCIONES;

namespace TFI.GUI.General
{
    public partial class LayoutBasico : System.Web.UI.MasterPage
    {
        private UsuarioCore _manager;
        private HttpContext Current = HttpContext.Current;
        public UsuarioEntidad usuario { get; set; }
        private int CadenaMaxima = 100;
        private EmpresaCore EmpresaBLL = new EmpresaCore();
        private FamiliaCore unManagerFamilia = new FamiliaCore();
        private MonedaCore _monedaManager;
        public List<MonedaEntidad> listaMonedas { get; set; }
        public MonedaEmpresaEntidad cotizacion { get; set; }
        public DropDownList combo { get; set; }
        public List<ProductoEntidad> productos;


        protected void cargarMonedas()
        {

            monedaDRW.DataSource = _monedaManager.FinAllMonedasByEmpresa();
            monedaDRW.DataValueField = "IdMoneda";
            monedaDRW.DataTextField = "Nombre";
            monedaDRW.DataBind();

        }



        public Int32 obtenerValorDropDown()
        {
            var val = (monedaDRW.SelectedValue);
            return Convert.ToInt32(val);

        }
        public void cambiarSeleccion(object sender, EventArgs e)
        {
            var valor = monedaDRW.SelectedItem.Text;
            var IdMoneda = monedaDRW.SelectedValue;
            Session["Cotizacion"] = devolverCotizacion(Convert.ToInt32(IdMoneda));
            cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];

        }

        public LayoutBasico()
        {
            _manager = new UsuarioCore();
            this._monedaManager = new MonedaCore();
        }
        protected MonedaEmpresaEntidad devolverCotizacion(int valor)
        {
            return _monedaManager.Select(valor);


        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                if (ddlLanguages.Items.FindByValue(CultureInfo.CurrentCulture.Name) != null)
                {
                    ddlLanguages.Items.FindByValue(CultureInfo.CurrentCulture.Name).Selected = true;
                }
            }

            //AGREGADOS PARA MONEDA/////
            cotizacion = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];

            if (!Page.IsPostBack)
            {
                if (cotizacion == null)
                {
                    Session["Cotizacion"] = devolverCotizacion(1);
                }


                // Session["Cotizacion"] = devolverCotizacion(1);
                cargarMonedas();
            }




            usuario = (UsuarioEntidad)Current.Session["Usuario"];

            nombreempresa.InnerHtml = EmpresaBLL.EmpresaSelectByCuit(ConfigSection.Default.Site.Cuit).NombreEmpresa;
            TelEmpresa.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "TelEmpresa", 1).Valor;
            MailEmpresa.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "MailEmpresa", 1).Valor;
            divLinkIntranet.Visible = false;

            if (usuario != null)
            {
                if (usuario.IdUsuarioTipo == 2)
                {
                    divLinkIntranet.Visible = true;
                }
                liIngresar.Visible = false;
                liRegistrarse.Visible = false;
                LiDeseos.Visible = true;
                SetUsuarioLogueado(usuario.Nombre + " " + usuario.Apellido);
                CargarListaDeseosEnSession();
            }
            else
            {
                LiDeseos.Visible = false;
            }
        }

        public void SetUsuarioLogueado(string label)
        {
            EtiquetaUsuario.InnerText = label;
            Salir.Text = "Salir";
            Salir.CssClass = "btn-danger";
        }

        protected void Salir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void Boton_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case ("Ingreso"):
                    usuario = new UsuarioEntidad();
                    usuario.Clave = Encriptacion.ToHash(IngresoClave.Value);
                    usuario = _manager.loginUsuario(usuario.Clave, IngresoUsuario.Value);

                    if (!string.IsNullOrEmpty(usuario.Nombre))
                    {
                        usuario.Familia = unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(usuario.IdUsuario);
                        Session["Usuario"] = usuario;
                        //Session["Permiso"] = unaFamilia.IdFamilia;
                        SetUsuarioLogueado(usuario.NombreUsuario);

                        CargarListaDeseosEnSession();

                        if (usuario.IdUsuarioTipo == 2)
                        {
                            divLinkIntranet.Visible = true;
                            Response.Redirect("/Areas/Intranet/Forms/ordenespedido.aspx");
                        }

                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        MensajeError.InnerText = "Usuario no registrado!";
                    }
                    break;
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            var searchQuery = Server.UrlEncode(txtSearch.Value);

            if (!string.IsNullOrEmpty(searchQuery))
            {
                if (searchQuery.Length <= CadenaMaxima)
                {
                    Response.Redirect("/Areas/Public/Forms/Catalogo.aspx?search=" + searchQuery);
                }
                else
                {
                    searchQuery = searchQuery.Substring(0, CadenaMaxima);
                    Response.Redirect("/Areas/Public/Forms/Catalogo.aspx?search=" + searchQuery);
                }
            }
        }

        protected void VerListaDeseos(object sender, EventArgs e)
        {
            Response.Redirect("ListaDeDeseos.aspx");
        }

        public void CargarListaDeseosEnSession()
        {
            ListaDeseosCore unaListaDeseosCore = new ListaDeseosCore();
            ProductoCore unProductoCore = new ProductoCore();
            List<ProductoEntidad> listaDeseos = new List<ProductoEntidad>();

            usuario = (UsuarioEntidad)Current.Session["Usuario"];

            Current.Session["ListaDeseos"] = new List<ProductoEntidad>();

            List<ListaDeseoEntidad> unasListaDeseoEntidad = new List<ListaDeseoEntidad>();
            unasListaDeseoEntidad = unaListaDeseosCore.ListaDeseosSelectAllByCUIT_NombreUsuario(usuario.NombreUsuario);
            var valorMonedaDropDown = Convert.ToInt32(obtenerValorDropDown());
            foreach (var item in unasListaDeseoEntidad)
            {
                ProductoEntidad unProductoEntidad = new ProductoEntidad();
                unProductoEntidad = unProductoCore.Find(item.IdProducto, valorMonedaDropDown);
                listaDeseos.Add(unProductoEntidad);
            }

            Current.Session["ListaDeseos"] = listaDeseos;
        }

        public FamiliaEntidad.PermisoFamilia Autenticacion()
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            if (usuarioAutenticado != null)
            {
                return usuarioAutenticado.Familia.IdFamilia;
            }
            return 0;
        }
    }
}