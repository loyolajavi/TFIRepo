using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;
using TFI.FUNCIONES;
using System.Text;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class UpdateEmpleado : System.Web.UI.Page
    {

        public UsuarioEntidad unEmpleado = new UsuarioEntidad();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        private FamiliaCore unManagerFamilia = new FamiliaCore();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public UsuarioFamiliaCore unManagerUsuarioFamilia = new UsuarioFamiliaCore();
        HttpContext Current = HttpContext.Current;
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
        private string usuarioString = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
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

            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null || this.Master.Autenticacion() < FamiliaEntidad.PermisoFamilia.Empleado)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            else if (this.Master.Autenticacion() == FamiliaEntidad.PermisoFamilia.Empleado)
            {
                Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            }
            
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
            ddlPermisosUsuarioUpdate.SelectedIndex = (int)unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(Int32.Parse(usuarioString)).IdFamilia - 1;//PONE EL PERMISO Q TIENE EL USUARIO;
            ddlPermisosUsuarioUpdate.DataBind();
        }



        public void cargarDatosEmpleado(){
            
            unEmpleado = unManagerUsuario.UsuarioSelectByIdUsuario(Int32.Parse(usuarioString));

            lblEmpleado.Text = unEmpleado.Nombre + " " + unEmpleado.Apellido;
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
                StringBuilder sb = new StringBuilder();
                unEmpleado = (UsuarioEntidad)Session["Empleado"];
                unEmpleado.Clave = Encriptacion.ToHash(txtClave.Value);
                unManagerUsuario.UpdateUsuarioContraseña(unEmpleado);
                sb.Append("<br />");
                divEspacioModifClave.InnerHtml = sb.ToString();
                divAlertaModifClave.Visible = true;
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