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
    public partial class AltaUsuario : System.Web.UI.Page
    {

        private FamiliaCore unManagerFamilia = new FamiliaCore();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public UsuarioFamiliaCore unManagerUsuarioFamilia = new UsuarioFamiliaCore();
        public List<CondicionFiscalEntidad> unosFiscales = new List<CondicionFiscalEntidad>();
        private CondicionFiscalCore unManagerFiscal = new CondicionFiscalCore();
        public List<UsuarioTipoEntidad> unosTiposUsuarios = new List<UsuarioTipoEntidad>();
        private UsuarioTipoCore unManagerUsuarioTipo = new UsuarioTipoCore();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        public UsuarioEntidad unUsuario = new UsuarioEntidad();
        


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                cargarFiscal();
                cargarTiposUsuarios();
                cargarPermisos();
                if (divDirFacturacion.Visible)
                {
                    cargarProvincias();
                }

            }

        }

        public void cargarPermisos()
        {
            ddlPermisosUsuarioAlta.DataSource = null;
            unasFamilias = unManagerFamilia.FamiliaSelectAll();
            ddlPermisosUsuarioAlta.DataSource = unasFamilias;
            ddlPermisosUsuarioAlta.DataValueField = "NombreFamilia";
            //ddlPermisosUsuarioUpdate.SelectedIndex = unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(Int32.Parse(usuarioString)).IdFamilia - 1;//PONE EL PERMISO Q TIENE EL USUARIO;
            ddlPermisosUsuarioAlta.DataBind();
        }


        public void cargarFiscal()
        {
            ddlFiscal.DataSource = null;
            unosFiscales = unManagerFiscal.CondicionFiscalSelectAll();
            ddlFiscal.DataSource = unosFiscales;
            ddlFiscal.DataValueField = "Descripcion";
            ddlFiscal.DataBind();


        }


        public void cargarTiposUsuarios()
        {
            ddlTipoUsuario.DataSource = null;
            unosTiposUsuarios = unManagerUsuarioTipo.UsuarioTipoSelectAll();
            ddlTipoUsuario.DataSource = unosTiposUsuarios;
            ddlTipoUsuario.DataValueField = "Descripcion";
            ddlTipoUsuario.DataBind();
        }

        public void cargarProvincias(){
            ddlProvincia.DataSource =  unManagerUsuario.SelectALLProvincias();
            ddlProvincia.DataValueField = "IdProvincia";
            ddlProvincia.DataTextField = "DescripcionProvincia";
            ddlProvincia.DataBind();

            ddlProvinciaEnvio.DataSource = unManagerUsuario.SelectALLProvincias();
            ddlProvinciaEnvio.DataValueField = "IdProvincia";
            ddlProvinciaEnvio.DataTextField = "DescripcionProvincia";
            ddlProvinciaEnvio.DataBind();
            
        }

        protected void btnAltaUsuario_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (ddlTipoUsuario.SelectedItem.Value == "Empleado")
                {
                    unUsuario.IdUsuarioTipo = ddlTipoUsuario.SelectedIndex + 1;
                    unUsuario.NombreUsuario = txtNombreUsuario.Value;
                    unUsuario.Clave = Encriptacion.ToHash(txtClave.Value);
                    unUsuario.Apellido = txtApellido.Value;
                    unUsuario.Nombre = txtNombre.Value;
                    unUsuario.Email = txtMail.Value;
                    unUsuario.IdCondicionFiscal = ddlFiscal.SelectedIndex + 1;
                    unUsuario.NroIdentificacion = txtDNICUIT.Value;
                    unUsuario.Familia.IdFamilia = ddlPermisosUsuarioAlta.SelectedIndex + 1;

                    int NroRetorno = unManagerUsuario.RegistrarUsuario(unUsuario);
                    StringBuilder sb = new StringBuilder();
                    if (NroRetorno == 0)
                    {
                        divAlertaUsCreado.Attributes["class"] = "alert alert-success";
                        sb.Append("Usuario creado correctamente");
                    }
                    else
                    {
                        divAlertaUsCreado.Attributes["class"] = "alert alert-warning";
                        sb.Append("El nombre de usuario ya existe");
                    }
                    divAlertaUsCreado.InnerText = sb.ToString();
                    divAlertaUsCreado.Visible = true;

                }
                
                
            }
            
        }

    }
}