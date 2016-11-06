using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;
using System.Text;


namespace TFI.GUI.Shared
{
    public partial class MiCuenta : System.Web.UI.MasterPage
    {
     
        private UsuarioCore _manager;
        HttpContext Current = HttpContext.Current;
        UsuarioEntidad usuario = new UsuarioEntidad();

        public MiCuenta()
        {
            _manager = new UsuarioCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var logueado = (UsuarioEntidad)Current.Session["Usuario"];
            
            if (logueado != null) 
            {
                liIngresar.Visible = false;
                liRegistrarse.Visible = false;
                LiPedido.Visible = true;
                LiDeseos.Visible = true;
                SetUsuarioLogueado(logueado.Nombre + " " + logueado.Apellido);
                CargarListaDeseosEnSession();
            }
            else
            {
                LiPedido.Visible = false;
                LiDeseos.Visible = false;
                Response.Redirect("Home.aspx");
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

                case ("Registrarse"):

                    usuario.Apellido = RegistroApellido.Value;
                    usuario.Clave = RegistroPassword1.Value;

                    usuario.NroIdentificacion = ""; //Por ahora se banca null pero hay que ver que hacemos
                    usuario.Email = RegistroEmail.Value;
                    usuario.IdUsuarioTipo = 1; //Esto lo sabemos porque son tipos fijos, 1 es cliente, 2 es empleado
                    usuario.Nombre = RegistroNombre.Value;
                    usuario.NombreUsuario = RegistroUsuario.Value;
                    usuario.IdCondicionFiscal = 1; //Y esto?? acepta null pero igual, de donde lo sacamos?

                    _manager.RegistrarUsuario(usuario);

                    Session["Usuario"] = usuario;
                    Response.Redirect("Home.aspx");
                    break;
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            var searchQuery = Server.UrlEncode(txtSearch.Value);
            Response.Redirect("/Areas/Public/Forms/Catalogo.aspx?search=" + searchQuery);
        }

        //public void ActualizarPedido()
        //{
        //    UsuarioEntidad UnUsuario = new UsuarioEntidad();
        //    UnUsuario = (UsuarioEntidad)Session["Usuario"];

        //    List<PedidoDetalleEntidad> ListaPedido = new List<PedidoDetalleEntidad>();
        //    ListaPedido = (List<PedidoDetalleEntidad>)Session["Prod"];

        //    StringBuilder sb = new StringBuilder();

        //    if (ListaPedido != null)
        //    {
        //        foreach (Item in ListaPedido)
        //        {
        //            sb.Append("<div class=\"form-group\">");
        //            sb.Append("<span class=\"label label-info\">");
        //            sb.Append(Item.Cantidad + " " + Item.Producto.DescripProducto + " " + Item.Producto.PrecioUnitario);
        //            sb.Append("</span>");
        //            sb.Append("</div>");
        //        }
        //    }
        //    sb.Append("<br/>");
        //    sb.Append("<br/>");
        //    sb.Append("<div class=\"form-group\">");
        //    sb.Append("<button runat=\"server\" class=\"btn btn-success btn-block\" id=\"PagarBoton\"  onserverclick=\"PagarClick\" >");
        //    sb.Append("Pagar");
        //    sb.Append("</button>");
        //    //sb.Append("<asp: ID=\"PagarBoton\" OnCommand=\"Boton_Command\" CommandName=\"Pagar\" runat=\"server\" CssClass=\"btn btn-success btn-block\" Text=\"Pagar\" />");
        //    sb.Append("</div>");
        //    PedidoDropDown.InnerHtml = sb.ToString();
        //    //EtiquetaUsuario.InnerText = label;
        //    //Salir.Text = "Salir";
        //    //Salir.CssClass = "btn-danger";
        //    //EtiquetaUsuario.CssClass = ""
        //}



        public void ActualizarDeseos()
        {
            var Current = HttpContext.Current;
            List<ProductoEntidad> listaDeseosSession = new List<ProductoEntidad>();
            listaDeseosSession = (List<ProductoEntidad>)Current.Session["ListaDeseos"];
            StringBuilder sb = new StringBuilder();
            
            if (listaDeseosSession != null)
            {
                foreach (ProductoEntidad Item in listaDeseosSession)
                {
                    sb.Append("<div class=\"form-group\">");
                    sb.Append("<span class=\"label label-info\">");
                    sb.Append(Item.DescripProducto);
                    sb.Append("</span>");
                    sb.Append("</div>");
                }
            }
            sb.Append("<br/>");
            sb.Append("<br/>");
            sb.Append("<div class=\"form-group\">");
            sb.Append("<button runat=\"server\" class=\"btn btn-success btn-block\" id=\"btnListaDeseos\"  onserverclick=\"VerListaDeseos\" >");
            //sb.Append("<a class=\"btn btn-success btn-block\" href=\"~\\ListaDeDeseos.aspx\"  >");
            sb.Append("Ver Lista Deseos");
            sb.Append("</button>");
            sb.Append("</div>");
            DeseosDropDown.InnerHtml = sb.ToString();
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

            Session["ListaDeseos"] = listaDeseos;
            ActualizarDeseos();
            //}
        }

    }
}