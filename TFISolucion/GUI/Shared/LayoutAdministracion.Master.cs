using System;
using System.Web;
using System.Web.UI.WebControls;
using TFI.CORE.Helpers;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.General
{
    public partial class LayoutAdministracion : System.Web.UI.MasterPage
    {
        private UsuarioCore _manager;
        private HttpContext Current = HttpContext.Current;
        public UsuarioEntidad usuario { get; set; }
        private FamiliaCore unManagerFamilia = new FamiliaCore();

        public LayoutAdministracion()
        {
            _manager = new UsuarioCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = new UsuarioEntidad();
            usuario = (UsuarioEntidad)Current.Session["Usuario"];

            if (usuario != null && Autenticacion() >= FamiliaEntidad.PermisoFamilia.Empleado)
            {
                liIngresar.Visible = false;
                liRegistrarse.Visible = false;
                SetUsuarioLogueado(usuario.Nombre + " " + usuario.Apellido);
            }
            else
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
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
            Response.Redirect("/Areas/public/forms/Home.aspx");
        }

        protected void Boton_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case ("Ingreso"):
                    usuario = _manager.loginUsuario(IngresoClave.Value, IngresoUsuario.Value);

                    if (!string.IsNullOrEmpty(usuario.Nombre))
                    {
                        Session["Usuario"] = usuario;
                        SetUsuarioLogueado(usuario.NombreUsuario);

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
                    usuario.NroIdentificacion = "";
                    usuario.Email = RegistroEmail.Value;
                    usuario.IdUsuarioTipo = 1; //Cliente
                    usuario.Nombre = RegistroNombre.Value;
                    usuario.NombreUsuario = RegistroUsuario.Value;
                    usuario.IdCondicionFiscal = 1;
                    usuario.Familia.IdFamilia = FamiliaEntidad.PermisoFamilia.Cliente; //Permisos de Cliente;

                    UsuarioEntidad UsuarioYaRegistrado = new UsuarioEntidad();
                    UsuarioYaRegistrado = _manager.Select(ConfigSection.Default.Site.Cuit, usuario.NombreUsuario);

                    if (string.IsNullOrEmpty(UsuarioYaRegistrado.NombreUsuario))
                    {
                        _manager.RegistrarUsuario(usuario);

                        Session["Usuario"] = usuario;
                        Response.Redirect("Home.aspx");
                    }

                    break;
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            var searchQuery = Server.UrlEncode(txtSearch.Value);
            Response.Redirect("/Areas/Public/Forms/Catalogo.aspx?search=" + searchQuery);
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