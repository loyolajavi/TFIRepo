using System;
using System.Collections.Generic;
using System.Text;
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

        public List<ProductoEntidad> productos;

        public LayoutBasico()
        {
            _manager = new UsuarioCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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

        //NO LO USARIA MAS*******************************************************************************************************)))))))))))))))))))))))))0000000000000000000000000000000
        //public void ActualizarDeseos()
        //{
        //    var Current = HttpContext.Current;
        //    List<ProductoEntidad> listaDeseosSession = new List<ProductoEntidad>();
        //    listaDeseosSession = (List<ProductoEntidad>)Current.Session["ListaDeseos"];
        //    StringBuilder sb = new StringBuilder();

        //    if (listaDeseosSession != null)
        //    {
        //        foreach (ProductoEntidad Item in listaDeseosSession)
        //        {
        //            sb.Append("<div class=\"form-group\">");
        //            sb.Append("<span class=\"label label-info\">");
        //            sb.Append(Item.DescripProducto);
        //            sb.Append("</span>");
        //            sb.Append("</div>");
        //        }
        //    }
        //    sb.Append("<br/>");
        //    sb.Append("<br/>");
        //    sb.Append("<a href=\"/Areas/Public/Forms/ListaDeDeseos.aspx\" runat=\"server\" class=\"btn btn-success btn btn-form\" id=\"btnListaDeseos\">");
        //    sb.Append("Deseos");
        //    sb.Append("</a>");
        //    DeseosDropDown.InnerHtml = sb.ToString();
        //}

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

            //if (listaDeseos != null)
            //{
            Current.Session["ListaDeseos"] = new List<ProductoEntidad>();
            //}
            //else
            //{
            List<ListaDeseoEntidad> unasListaDeseoEntidad = new List<ListaDeseoEntidad>();
            unasListaDeseoEntidad = unaListaDeseosCore.ListaDeseosSelectAllByCUIT_NombreUsuario(usuario.NombreUsuario);

            foreach (var item in unasListaDeseoEntidad)
            {
                ProductoEntidad unProductoEntidad = new ProductoEntidad();
                unProductoEntidad = unProductoCore.Find(item.IdProducto);
                listaDeseos.Add(unProductoEntidad);
            }

            Current.Session["ListaDeseos"] = listaDeseos;
            //ActualizarDeseos();???????????????????????????????????????????????????????????????????????????????????????????????????????????????????
            //}
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