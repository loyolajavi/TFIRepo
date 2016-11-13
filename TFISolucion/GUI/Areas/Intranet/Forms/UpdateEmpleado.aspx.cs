using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class UpdateEmpleado : System.Web.UI.Page
    {

        public UsuarioEntidad unEmpleado = new UsuarioEntidad();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        private FamiliaCore unManagerFamilia = new FamiliaCore();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public UsuarioFamiliaCore unManagerUsuarioFamilia = new UsuarioFamiliaCore();
        HttpContext Current = HttpContext.Current;

        private string usuarioString = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioString = Page.Request.QueryString["Emple"];

            if (!IsPostBack)
            {
                

                
                if (!string.IsNullOrEmpty(usuarioString))
                {
                    cargarPermisos();
                    cargarDatosEmpleado();



                }
                else
                {
                    Response.Redirect(Request.RawUrl);
                }
            }



        }

        public void cargarPermisos()
        {
            ddlPermisosUsuarioUpdate.DataSource = null;
            unasFamilias = unManagerFamilia.FamiliaSelectAll();
            ddlPermisosUsuarioUpdate.DataSource = unasFamilias;
            ddlPermisosUsuarioUpdate.DataValueField = "NombreFamilia";
            ddlPermisosUsuarioUpdate.SelectedIndex = unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(Int32.Parse(usuarioString)).IdFamilia - 1;//PONE EL PERMISO Q TIENE EL USUARIO;
            ddlPermisosUsuarioUpdate.DataBind();
        }



        public void cargarDatosEmpleado(){
            
            unEmpleado = unManagerUsuario.UsuarioSelectByIdUsuario(Int32.Parse(usuarioString));
            
            Session["Empleado"] = (UsuarioEntidad)unEmpleado;
            txtNombreUsuario.Value = unEmpleado.NombreUsuario;
            txtClave.Value = "********";
            txtClaveRep.Value = "********";
            txtApellido.Value = unEmpleado.Apellido;
            txtNombre.Value = unEmpleado.Nombre;
            txtMail.Value = unEmpleado.Email;
            txtDNI.Value = unEmpleado.NroIdentificacion;
        }

        protected void btnDatosUsuarioUpdate_Click(object sender, EventArgs e)
        {
            //VALIDAR
            unEmpleado.Apellido = txtApellido.Value;
            unEmpleado.Nombre = txtNombre.Value;
            unEmpleado.Email = txtMail.Value;
            unEmpleado.NroIdentificacion = txtDNI.Value;
            unEmpleado.IdUsuario = Int32.Parse(usuarioString);
            unManagerUsuario.UsuarioUpdateDatosPersonalesConDNI(unEmpleado);
            cargarDatosEmpleado();
        }

        protected void btnPermisosUsuarioUpdate_Click(object sender, EventArgs e)
        {
            unEmpleado = (UsuarioEntidad)Session["Empleado"];
            UsuarioFamiliaEntidad unUsuarioFamilia = new UsuarioFamiliaEntidad();
            unUsuarioFamilia.NombreUsuario = unEmpleado.NombreUsuario;
            unUsuarioFamilia.IdFamilia = ddlPermisosUsuarioUpdate.SelectedIndex + 1;
            unManagerUsuarioFamilia.UsuarioUpdatePermisosFamilia(unUsuarioFamilia);
            cargarDatosEmpleado();
        }

        protected void btnCambiarClave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                txtNombreUsuario.Value = "HOOOOOOOOOOLA";
            }
        }

        protected void btnNombreUsuario_Click(object sender, EventArgs e)
        {
            unEmpleado.NombreUsuario = txtNombreUsuario.Value;
            unEmpleado.IdUsuario = Int32.Parse(usuarioString);
            unManagerUsuario.UsuarioUpdateNombreUsuario(unEmpleado);
        }
    }
}