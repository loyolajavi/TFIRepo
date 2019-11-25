using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Helpers;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.Entidades.Servicios.Permisos;
using TFI.FUNCIONES;
using System.Linq;

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
        private LenguajeEntidad idioma;


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

        public string obtenerIdiomaCombo()
        {
            var val = (ddlLanguages.SelectedItem.Value);
            var val2= ddlLanguages.SelectedValue;
            return (val2);

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
            idioma = new LenguajeEntidad();
        }
        protected MonedaEmpresaEntidad devolverCotizacion(int valor)
        {
            return _monedaManager.Select(valor);


        }

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                if (ddlLanguages.Items.FindByValue(CultureInfo.CurrentCulture.Name) != null)
                {
                    ddlLanguages.Items.FindByValue(CultureInfo.CurrentCulture.Name).Selected = true;
                }
                if (idioma == null)
                {
                    Session["Idioma"] = obtenerIdiomaCombo();
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
                ComprasDrop.Visible = true;
                SetUsuarioLogueado(usuario.Nombre + " " + usuario.Apellido);
                CargarListaDeseosEnSession();
                CargarComprasEnSession();
            }
            else
            {
                LiDeseos.Visible = false;
                ComprasDrop.Visible = false;
            }
        }

        public void SetUsuarioLogueado(string label)
        {
            EtiquetaUsuario.InnerText = label;
            Salir.Visible = true;
            Salir.CssClass = "btn-danger";
        }

        protected void Salir_Click(object sender, EventArgs e)
        {
            TFI.SEGURIDAD.ServicioLog.CrearLog("Deslogueo", "Deslogueo Correcto", usuario.NombreUsuario, CORE.Helpers.ConfigSection.Default.Site.Cuit.ToString());
            Session.Abandon();
            Response.Redirect("/Areas/Public/Forms/Home.aspx");
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
            Response.Redirect("/Areas/Public/Forms/ListaDeDeseos.aspx");
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

        public void CargarComprasEnSession()
        {
            List<PedidoEntidad> unosPedidosRealizados = new List<PedidoEntidad>();
            PedidoCore ManagerPedidos = new PedidoCore();
            usuario = (UsuarioEntidad)Current.Session["Usuario"];
            unosPedidosRealizados = ManagerPedidos.SelectAllByCUIT_NombreUsuario(usuario.NombreUsuario);
            unosPedidosRealizados.RemoveAll(X => X.VerEstadoActual().IdEstadoPedido != (int)EstadoPedidoEntidad.Options.PendientePago);
            Session.Add("Compras", unosPedidosRealizados); 
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

        public bool Autenticar(string elPermiso)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            string[] PermisosPagina = { elPermiso };

            if (usuarioAutenticado != null)
            {
                if (usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == elPermiso))
                    return true;
                if (CORE.Servicios.BLLFamilia.BuscarPermiso(usuarioAutenticado.Permisos, PermisosPagina))
                    return true;
                //return usuarioAutenticado.Permisos.Any(X => X.NombreIFamPat == elPermiso);
            }
            return false;

        }


        public bool Autenticar(string[] losPermisosARevisar)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            //string[] PermisosPagina = { elPermiso };

            if (usuarioAutenticado != null)
            {
                foreach (string unTag in losPermisosARevisar)
                {
                    if (usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == unTag))
                        return true;
                }

                return CORE.Servicios.BLLFamilia.BuscarPermiso(usuarioAutenticado.Permisos, losPermisosARevisar);
            }
            return false;

        }


        public void RealizarLogueo(string elUsuario, string laClave)
        {
            usuario = new UsuarioEntidad();
            usuario.Clave = Encriptacion.ToHash(laClave);
            usuario = _manager.loginUsuario(usuario.Clave, elUsuario);

            if (!string.IsNullOrEmpty(usuario.Nombre))
            {
                usuario.Familia = unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(usuario.IdUsuario);
                usuario.Permisos = _manager.UsuarioTraerPermisos(usuario.NombreUsuario, usuario.CUIT);
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
                //Asociado al UpdatePanel1 y al modal fade Id=LogueoFallido para emitir un msj cuando el login falla
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(),
                //           "ModalLogueo", "$('#LogueoFallido').modal('show');", true);
                
            }
        }

        protected void Loguear(object sender, EventArgs e)
        {
            RealizarLogueo(IngresoUsuario.Value, IngresoClave.Value);
        }

    }
}