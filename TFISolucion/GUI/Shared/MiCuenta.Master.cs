using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Shared
{
    public partial class MiCuenta : System.Web.UI.MasterPage
    {
        private UsuarioCore _manager;
        private HttpContext Current = HttpContext.Current;
        private UsuarioEntidad usuario = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        public List<ProductoEntidad> AuxDeseos;
        public MiCuenta()
        {
            idioma = new LenguajeEntidad();
            _manager = new UsuarioCore();
        }
        public string obtenerIdiomaCombo()
        {
            var val = (ddlLanguages.SelectedItem.Value);
            var val2 = ddlLanguages.SelectedValue;
            return (val2);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado != null)
            {
                liIngresar.Visible = false;
                LiDeseos.Visible = true;
                SetUsuarioLogueado(logueado.Nombre + " " + logueado.Apellido);

                AuxDeseos = (List<ProductoEntidad>)Current.Session["ListaDeseos"];


                if (AuxDeseos == null || !AuxDeseos.Any())
                {
                    CargarListaDeseosEnSession();
                }
            }
            else
            {
                LiDeseos.Visible = false;
                Response.Redirect("Home.aspx");
            }
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
        }

        public void SetUsuarioLogueado(string label)
        {
            EtiquetaUsuario.InnerText = label;
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
                    usuario = _manager.loginUsuario(IngresoClave.Value, IngresoUsuario.Value);

                    //var Current = HttpContext.Current;
                    //listaDeseos = (List<ProductoEntidad>)Current.Session["ListaDeseos"];

                    if (!string.IsNullOrEmpty(usuario.Nombre))
                    {
                        Session["Usuario"] = usuario;
                        SetUsuarioLogueado(usuario.NombreUsuario);

                        CargarListaDeseosEnSession();

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
            Response.Redirect("/Areas/Public/Forms/Catalogo.aspx?search=" + searchQuery);
        }

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

            Current.Session["ListaDeseos"] = new List<ProductoEntidad>();

            List<ListaDeseoEntidad> unasListaDeseoEntidad = new List<ListaDeseoEntidad>();
            unasListaDeseoEntidad = unaListaDeseosCore.ListaDeseosSelectAllByCUIT_NombreUsuario(usuario.NombreUsuario);

            foreach (var item in unasListaDeseoEntidad)
            {
                ProductoEntidad unProductoEntidad = new ProductoEntidad();
                unProductoEntidad = unProductoCore.Find(item.IdProducto,1);
                listaDeseos.Add(unProductoEntidad);
            }

            Current.Session["ListaDeseos"] = listaDeseos;
            //ActualizarDeseos();
        }
    }
}