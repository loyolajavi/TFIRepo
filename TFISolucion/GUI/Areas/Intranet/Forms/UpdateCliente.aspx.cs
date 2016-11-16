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
    public partial class UpdateCliente : System.Web.UI.Page
    {
        public UsuarioEntidad unCliente = new UsuarioEntidad();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        private FamiliaCore unManagerFamilia = new FamiliaCore();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public UsuarioFamiliaCore unManagerUsuarioFamilia = new UsuarioFamiliaCore();
        public List<CondicionFiscalEntidad> unosFiscales = new List<CondicionFiscalEntidad>();
        private CondicionFiscalCore unManagerFiscal = new CondicionFiscalCore();
        HttpContext Current = HttpContext.Current;

        private string usuarioString = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null || this.Master.Autenticacion() < FamiliaEntidad.PermisoFamilia.Empleado)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            else if (this.Master.Autenticacion() == FamiliaEntidad.PermisoFamilia.Empleado)
            {
                Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            }

            usuarioString = Page.Request.QueryString["Cli"];

            if (!IsPostBack)
            {

                if (!string.IsNullOrEmpty(usuarioString))
                {
                    cargarPermisos();
                    cargarDatosCliente();

                    cargarFiscal();
                    cargarProvincias();

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

        public void cargarDatosCliente()
        {

            unCliente = unManagerUsuario.UsuarioSelectByIdUsuario(Int32.Parse(usuarioString));

            lblCliente.Text = unCliente.Nombre + " " + unCliente.Apellido;
            Session["Cliente"] = (UsuarioEntidad)unCliente;
            txtNombreUsuario.Value = unCliente.NombreUsuario;
            txtClave.Value = "********";
            txtClaveRep.Value = "********";
            txtApellido.Value = unCliente.Apellido;
            txtNombre.Value = unCliente.Nombre;
            ddlFiscalCliente.SelectedIndex = (int)unCliente.IdCondicionFiscal.Value - 1;
            txtMail.Value = unCliente.Email;
            txtDNI.Value = unCliente.NroIdentificacion;

        }


        protected void btnDatosUsuarioUpdate_Click(object sender, EventArgs e)
        {
            
            unCliente.Apellido = txtApellido.Value;
            unCliente.Nombre = txtNombre.Value;
            unCliente.Email = txtMail.Value;
            unCliente.NroIdentificacion = txtDNI.Value;
            unCliente.IdUsuario = Int32.Parse(usuarioString);
            unManagerUsuario.UsuarioUpdateDatosPersonalesConDNI(unCliente);
            cargarDatosCliente();
        }

        protected void btnPermisosUsuarioUpdate_Click(object sender, EventArgs e)
        {
            unCliente = (UsuarioEntidad)Session["Cliente"];
            UsuarioFamiliaEntidad unUsuarioFamilia = new UsuarioFamiliaEntidad();
            unUsuarioFamilia.NombreUsuario = unCliente.NombreUsuario;
            unUsuarioFamilia.IdFamilia = ddlPermisosUsuarioUpdate.SelectedIndex + 1;
            unManagerUsuarioFamilia.UsuarioUpdatePermisosFamilia(unUsuarioFamilia);
            cargarPermisos();
        }

        protected void btnCambiarClave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                StringBuilder sb = new StringBuilder();
                unCliente = (UsuarioEntidad)Session["Cliente"];
                unCliente.Clave = Encriptacion.ToHash(txtClave.Value);
                unManagerUsuario.UpdateUsuarioContraseña(unCliente);
                sb.Append("<br />");
                divEspacioModifClave.InnerHtml = sb.ToString();
                divAlertaModifClave.Visible = true;
            }
        }

        protected void btnNombreUsuario_Click(object sender, EventArgs e)
        {
            unCliente.NombreUsuario = txtNombreUsuario.Value;
            unCliente.IdUsuario = Int32.Parse(usuarioString);
            unManagerUsuario.UsuarioUpdateNombreUsuario(unCliente);
        }


        public void cargarFiscal()
        {
            ddlFiscalCliente.DataSource = null;
            unosFiscales = unManagerFiscal.CondicionFiscalSelectAll();
            ddlFiscalCliente.DataSource = unosFiscales;
            ddlFiscalCliente.DataTextField = "Descripcion";
            ddlFiscalCliente.DataValueField = "IdCondicionFiscal";
            ddlFiscalCliente.DataBind();
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

        protected void btnUpdateFacturacion_Click(object sender, EventArgs e)
        {
            //FACTURACION

            StringBuilder sb = new StringBuilder();
            DireccionEntidad NuevaDireccion = new DireccionEntidad();
            DireccionUsuarioEntidad NuevaIntermedia = new DireccionUsuarioEntidad();
            DireccionEntidad DireccionEnvio = new DireccionEntidad();
            DireccionUsuarioEntidad DireIntermediaEnvio = new DireccionUsuarioEntidad();

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

            unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, NuevaIntermedia);
        }

        protected void btnUpdateEnvio_Click(object sender, EventArgs e)
        {
            //ENVIO

            StringBuilder sb = new StringBuilder();
            DireccionEntidad NuevaDireccion = new DireccionEntidad();
            DireccionUsuarioEntidad NuevaIntermedia = new DireccionUsuarioEntidad();
            DireccionEntidad DireccionEnvio = new DireccionEntidad();
            DireccionUsuarioEntidad DireIntermediaEnvio = new DireccionUsuarioEntidad();

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

            unManagerUsuario.InsertDireccionDeFacturacion(DireccionEnvio, DireIntermediaEnvio);

        }

        public void cargarDireFacturacion()
        {

            unCliente = unManagerUsuario.UsuarioSelectByIdUsuario(Int32.Parse(usuarioString));

            //DireccionesDeUsuario = UsuarioBLL.SelectDireccionesDeUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);


            //txtCalle.Value;
            //txtNumero.Value;
            //txtPiso.Value;
            //txtDpartamento.Value;
            //txtLocalidad.Value;
            //ddlProvincia.SelectedIndex + 1;

            






            lblCliente.Text = unCliente.Nombre + " " + unCliente.Apellido;
            Session["Cliente"] = (UsuarioEntidad)unCliente;
            txtNombreUsuario.Value = unCliente.NombreUsuario;
            txtClave.Value = "********";
            txtClaveRep.Value = "********";
            txtApellido.Value = unCliente.Apellido;
            txtNombre.Value = unCliente.Nombre;
            ddlFiscalCliente.SelectedIndex = (int)unCliente.IdCondicionFiscal;
            txtMail.Value = unCliente.Email;
            txtDNI.Value = unCliente.NroIdentificacion;

        }




    }
}