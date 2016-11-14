﻿using System;
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

        public void cargarProvincias()
        {
            ddlProvincia.DataSource = unManagerUsuario.SelectALLProvincias();
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
            StringBuilder sb = new StringBuilder();
            DireccionEntidad NuevaDireccion = new DireccionEntidad();
            DireccionUsuarioEntidad NuevaIntermedia = new DireccionUsuarioEntidad();
            DireccionEntidad DireccionEnvio = new DireccionEntidad();
            DireccionUsuarioEntidad DireIntermediaEnvio = new DireccionUsuarioEntidad();
            var NroRetorno = 0;

            Page.Validate("AltaEmpleado,AltaCliente");
            if (Page.IsValid)
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
                
                if (ddlTipoUsuario.SelectedItem.Value == "Cliente")
                {
                    //SOLO DEL CLIENTE
                    //FACTURACION
                    
                    NuevaDireccion.IdTipoDireccion = 1;//Facturacion
                    NuevaDireccion.Calle = txtCalle.Value;
                    NuevaDireccion.Numero = Int32.Parse(txtNumero.Value);
                    if (!string.IsNullOrEmpty(txtPiso.Value))
                    {
                        NuevaDireccion.Piso = Int32.Parse(txtPiso.Value);
                    }
                    if (!string.IsNullOrEmpty(txtDpartamento.Value))
                    {
                        NuevaDireccion.Departamento = txtDpartamento.Value;
                    }
                    NuevaDireccion.Localidad = txtLocalidad.Value;
                    NuevaDireccion.IdProvincia = ddlProvincia.SelectedIndex + 1;

                    NuevaIntermedia.CUIT = ConfigSection.Default.Site.Cuit;
                    NuevaIntermedia.NombreUsuario = txtNombreUsuario.Value;
                    NuevaIntermedia.Predeterminada = true;

                    //ENVIO
                   

                    DireccionEnvio.IdTipoDireccion = 2;//Envio
                    DireccionEnvio.Calle = txtCalleEnvio.Value;
                    DireccionEnvio.Numero = Int32.Parse(txtNumeroEnvio.Value);
                    if (!string.IsNullOrEmpty(txtPisoEnvio.Value))
                    {
                        DireccionEnvio.Piso = Int32.Parse(txtPisoEnvio.Value);
                    }
                    if (!string.IsNullOrEmpty(txtDepartamentoEnvio.Value))
                    {
                        DireccionEnvio.Departamento = txtDepartamentoEnvio.Value;
                    }
                    DireccionEnvio.Localidad = txtLocalidadEnvio.Value;
                    DireccionEnvio.IdProvincia = ddlProvinciaEnvio.SelectedIndex + 1;

                    DireIntermediaEnvio.CUIT = ConfigSection.Default.Site.Cuit;
                    DireIntermediaEnvio.NombreUsuario = txtNombreUsuario.Value;
                    DireIntermediaEnvio.Predeterminada = true;
                }

                NroRetorno = unManagerUsuario.RegistrarUsuario(unUsuario);

                if (ddlTipoUsuario.SelectedItem.Value == "Cliente")
                {
                    unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, NuevaIntermedia);

                    unManagerUsuario.InsertDireccionDeFacturacion(DireccionEnvio, DireIntermediaEnvio);
                }
                
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


            }
            else
            {
                divAlertaUsCreado.Attributes["class"] = "alert alert-danger";
                sb.Append("Error al crear usuario");
            }
            divAlertaUsCreado.InnerText = sb.ToString();
            divAlertaUsCreado.Visible = true;
            limpiarCampos();
        }

        public void limpiarCampos()
        {

            txtNombreUsuario.Value = string.Empty;
            txtApellido.Value = string.Empty;
            txtNombre.Value = string.Empty;
            txtMail.Value = string.Empty;
            txtDNICUIT.Value = string.Empty;
            ddlTipoUsuario.SelectedIndex = 0;
            ddlFiscal.SelectedIndex = 0;
            ddlPermisosUsuarioAlta.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
            ddlProvinciaEnvio.SelectedIndex = 0;

            txtCalle.Value = string.Empty;
            txtNumero.Value = string.Empty;
            txtPiso.Value = string.Empty;
            txtDpartamento.Value = string.Empty;
            txtLocalidad.Value = string.Empty;
            txtCalleEnvio.Value = string.Empty;
            txtNumeroEnvio.Value = string.Empty;
            txtPisoEnvio.Value = string.Empty;
            txtDepartamentoEnvio.Value = string.Empty;
            txtLocalidadEnvio.Value = string.Empty;


        }

    }
}