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
using TFI.Entidades.Servicios.Permisos;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class AltaUsuario : BasePage
    {

        private FamiliaCore unManagerFamilia = new FamiliaCore();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public List<CondicionFiscalEntidad> unosFiscales = new List<CondicionFiscalEntidad>();
        private CondicionFiscalCore unManagerFiscal = new CondicionFiscalCore();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        public UsuarioEntidad unUsuario = new UsuarioEntidad();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        string[] unosPermisosTest;

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

            unosPermisosTest = new string[] { "Publico", "Cliente" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest)) //this.Master.Autenticacion() < FamiliaEntidad.PermisoFamilia.Empleado)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            unosPermisosTest = new string[] { "Empleado" };
            if (this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            }

            if (!IsPostBack)
            {

                //ALTA CLIENTE BORRADO
                //cargarFiscal();
                //ALTA CLIENTE BORRADO
                //cargarTiposUsuarios();
                cargarPermisos();
                //ALTA CLIENTE BORRADO
                //if (divDirFacturacion.Visible)
                //{
                //    cargarProvincias();
                //}

            }

        }

        public void cargarPermisos()
        {
            ddlPermisosUsuarioAlta.DataSource = null;
            unasFamilias = unManagerFamilia.FamiliaSelectAll();
          
            ddlPermisosUsuarioAlta.DataSource = unasFamilias.Where(o=> (o.IdFamilia == FamiliaEntidad.PermisoFamilia.Empleado || o.IdFamilia==FamiliaEntidad.PermisoFamilia.Admin));
            ddlPermisosUsuarioAlta.DataValueField = "NombreFamilia";
            //ddlPermisosUsuarioUpdate.SelectedIndex = unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(Int32.Parse(usuarioString)).IdFamilia - 1;//PONE EL PERMISO Q TIENE EL USUARIO;
            ddlPermisosUsuarioAlta.DataBind();
        }


        //ALTA CLIENTE BORRADO
        //public void cargarFiscal()
        //{
        //    ddlFiscal.DataSource = null;
        //    unosFiscales = unManagerFiscal.CondicionFiscalSelectAll();
        //    ddlFiscal.DataSource = unosFiscales;
        //    ddlFiscal.DataValueField = "Descripcion";
        //    ddlFiscal.DataBind();


        //}

        //ALTA CLIENTE BORRADO
        //public void cargarTiposUsuarios()
        //{
        //    ddlTipoUsuario.DataSource = null;
        //    unosTiposUsuarios = unManagerUsuarioTipo.UsuarioTipoSelectAll();
        //    ddlTipoUsuario.DataSource = unosTiposUsuarios;
        //    ddlTipoUsuario.DataValueField = "Descripcion";
        //    ddlTipoUsuario.DataBind();
        //}


        //public void cargarProvincias()
        //{
        //    ddlProvincia.DataSource = unManagerUsuario.SelectALLProvincias();
        //    ddlProvincia.DataValueField = "IdProvincia";
        //    ddlProvincia.DataTextField = "DescripcionProvincia";
        //    ddlProvincia.DataBind();

        //    ddlProvinciaEnvio.DataSource = unManagerUsuario.SelectALLProvincias();
        //    ddlProvinciaEnvio.DataValueField = "IdProvincia";
        //    ddlProvinciaEnvio.DataTextField = "DescripcionProvincia";
        //    ddlProvinciaEnvio.DataBind();

        //}

        protected void btnAltaUsuario_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            var NroRetorno = 0;

            Page.Validate("AltaEmpleado");
            if (Page.IsValid)
            {

                unUsuario.IdUsuarioTipo = 2; //Significa Empleado y se quita lo siguiente porque los clietes se dan de alta en la web pública //ddlTipoUsuario.SelectedIndex + 1;
                unUsuario.NombreUsuario = txtNombreUsuario.Value;
                unUsuario.Clave = Encriptacion.ToHash(txtClave.Value);
                unUsuario.Apellido = txtApellido.Value;
                unUsuario.Nombre = txtNombre.Value;
                unUsuario.Email = txtMail.Value;
                //unUsuario.IdCondicionFiscal = ddlFiscal.SelectedIndex + 1;
                unUsuario.NroIdentificacion = txtDNICUIT.Value;
                unUsuario.Permisos.Add(new Familia());
                unUsuario.Permisos[0].IdIFamPat = (int)ddlPermisosUsuarioAlta.SelectedIndex + 3;


                //ALTA CLIENTE BORRADO
                //if (ddlTipoUsuario.SelectedItem.Value == "Cliente")
                //{
                //    //SOLO DEL CLIENTE
                //    //FACTURACION

                //    NuevaDireccion.IdTipoDireccion = 1;//Facturacion
                //    NuevaDireccion.Calle = txtCalle.Value;
                //    NuevaDireccion.Numero = Int32.Parse(txtNumero.Value);
                //    if (!string.IsNullOrEmpty(txtPiso.Value))
                //    {
                //        NuevaDireccion.Piso = Int32.Parse(txtPiso.Value);
                //    }
                //    if (!string.IsNullOrEmpty(txtDpartamento.Value))
                //    {
                //        NuevaDireccion.Departamento = txtDpartamento.Value;
                //    }
                //    NuevaDireccion.Localidad = txtLocalidad.Value;
                //    NuevaDireccion.IdProvincia = ddlProvincia.SelectedIndex + 1;

                //    NuevaIntermedia.CUIT = ConfigSection.Default.Site.Cuit;
                //    NuevaIntermedia.NombreUsuario = txtNombreUsuario.Value;
                //    NuevaIntermedia.Predeterminada = true;

                //    //ENVIO


                //    DireccionEnvio.IdTipoDireccion = 2;//Envio
                //    DireccionEnvio.Calle = txtCalleEnvio.Value;
                //    DireccionEnvio.Numero = Int32.Parse(txtNumeroEnvio.Value);
                //    if (!string.IsNullOrEmpty(txtPisoEnvio.Value))
                //    {
                //        DireccionEnvio.Piso = Int32.Parse(txtPisoEnvio.Value);
                //    }
                //    if (!string.IsNullOrEmpty(txtDepartamentoEnvio.Value))
                //    {
                //        DireccionEnvio.Departamento = txtDepartamentoEnvio.Value;
                //    }
                //    DireccionEnvio.Localidad = txtLocalidadEnvio.Value;
                //    DireccionEnvio.IdProvincia = ddlProvinciaEnvio.SelectedIndex + 1;

                //    DireIntermediaEnvio.CUIT = ConfigSection.Default.Site.Cuit;
                //    DireIntermediaEnvio.NombreUsuario = txtNombreUsuario.Value;
                //    DireIntermediaEnvio.Predeterminada = true;
                //}

                NroRetorno = unManagerUsuario.RegistrarUsuario(unUsuario);

                //ALTA CLIENTE BORRADO
                //if (ddlTipoUsuario.SelectedItem.Value == "Cliente")
                //{
                //    unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, NuevaIntermedia);

                //    unManagerUsuario.InsertDireccionDeFacturacion(DireccionEnvio, DireIntermediaEnvio);
                //}

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
            //ALTA CLIENTE BORRADO
            //ddlTipoUsuario.SelectedIndex = 0;
            //ddlFiscal.SelectedIndex = 0;
            ddlPermisosUsuarioAlta.SelectedIndex = 0;
            //ALTA CLIENTE BORRADO
            //ddlProvincia.SelectedIndex = 0;
            //ddlProvinciaEnvio.SelectedIndex = 0;

            //txtCalle.Value = string.Empty;
            //txtNumero.Value = string.Empty;
            //txtPiso.Value = string.Empty;
            //txtDpartamento.Value = string.Empty;
            //txtLocalidad.Value = string.Empty;
            //txtCalleEnvio.Value = string.Empty;
            //txtNumeroEnvio.Value = string.Empty;
            //txtPisoEnvio.Value = string.Empty;
            //txtDepartamentoEnvio.Value = string.Empty;
            //txtLocalidadEnvio.Value = string.Empty;


        }

    }
}