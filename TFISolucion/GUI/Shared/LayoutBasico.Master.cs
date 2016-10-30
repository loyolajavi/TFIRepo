using System;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.General
{
    public partial class LayoutBasico : System.Web.UI.MasterPage
    {
        private UsuarioCore _manager;

        public LayoutBasico()
        {
            _manager = new UsuarioCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public bool IngresoDeUsuario
        {
            set
            {
                liIngresar.Visible = value;
                liRegistrarse.Visible = value;
            }
        }

        public bool EgresoDeUsuario
        {
            set
            {
                liIngresar.Visible = value;
                liRegistrarse.Visible = value;
            }
        }

        public void SetUsuarioLogueado(string label)
        {
            EtiquetaUsuario.InnerText = label;
            Salir.Text = "Salir";
            Salir.CssClass = "btn-danger";
            //EtiquetaUsuario.CssClass = ""
        }

        protected void IngresoBoton_Click(object sender, EventArgs e)
        {
        }

        protected void Salir_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void RegistrarBoton_Click(object sender, EventArgs e)
        {
        }

        protected void Boton_Command(object sender, CommandEventArgs e)
        {
            var usuario = new UsuarioEntidad();

            switch (e.CommandName)
            {
                case ("Ingreso"):
                    usuario = _manager.loginUsuario(IngresoClave.Value, IngresoUsuario.Value);

                    if (!string.IsNullOrEmpty(usuario.Nombre))
                    {
                        Session["Usuario"] = usuario;
                        Response.Redirect("Home.aspx");
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

    }
}