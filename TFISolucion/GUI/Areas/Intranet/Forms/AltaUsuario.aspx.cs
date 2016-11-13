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
        


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                cargarFiscal();
                cargarTiposUsuarios();
                cargarPermisos();

            }

        }

        public void cargarPermisos()
        {
            ddlPermisosUsuarioUpdate.DataSource = null;
            unasFamilias = unManagerFamilia.FamiliaSelectAll();
            ddlPermisosUsuarioUpdate.DataSource = unasFamilias;
            ddlPermisosUsuarioUpdate.DataValueField = "NombreFamilia";
            //ddlPermisosUsuarioUpdate.SelectedIndex = unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(Int32.Parse(usuarioString)).IdFamilia - 1;//PONE EL PERMISO Q TIENE EL USUARIO;
            ddlPermisosUsuarioUpdate.DataBind();
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

    }
}