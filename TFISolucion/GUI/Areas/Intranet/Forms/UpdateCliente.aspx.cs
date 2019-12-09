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
using TFI.CORE.Servicios;
using TFI.SEGURIDAD;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class UpdateCliente : BasePage
    {
        public UsuarioEntidad unCliente = new UsuarioEntidad();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        private FamiliaCore unManagerFamilia = new FamiliaCore();
        public List<FamiliaEntidad> unasFamilias = new List<FamiliaEntidad>();
        public BLLFamilia unManagerUsuarioFamilia = new BLLFamilia();
        public List<CondicionFiscalEntidad> unosFiscales = new List<CondicionFiscalEntidad>();
        private CondicionFiscalCore unManagerFiscal = new CondicionFiscalCore();
        HttpContext Current = HttpContext.Current;
        private LenguajeEntidad idioma;
        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();
        public List<ProvinciaEntidad> unasProvinciasEnvio = new List<ProvinciaEntidad>();

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

            usuarioentidad = (UsuarioEntidad)Current.Session["Usuario"];

            string[] unosPermisosTest = new string[] { "Publico", "Cliente" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            unosPermisosTest = new string[] { "Empleado" };
            if (this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            }

            usuarioString = Page.Request.QueryString["Cli"];

            if (!IsPostBack)
            {

                if (!string.IsNullOrEmpty(usuarioString))
                {
                    //cargarPermisos();
                    cargarDatosCliente();

                    cargarFiscal();
                    cargarProvincias();
                    cargarLocalidades();
                    cargarProvinciasEnvio();
                    cargarLocalidadesEnvio();
                }
                else
                {
                    Response.Redirect(Request.RawUrl);
                }
            }

        }


        //public void cargarPermisos()
        //{
        //    ddlPermisosUsuarioUpdate.DataSource = null;
        //    unasFamilias = unManagerFamilia.FamiliaSelectAll();
        //    ddlPermisosUsuarioUpdate.DataSource = unasFamilias;
        //    ddlPermisosUsuarioUpdate.DataValueField = "NombreFamilia";
        //    ddlPermisosUsuarioUpdate.SelectedIndex = (int)unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(Int32.Parse(usuarioString)).IdFamilia - 1;//PONE EL PERMISO Q TIENE EL USUARIO;
        //    ddlPermisosUsuarioUpdate.DataBind();
        //}

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

        //protected void btnPermisosUsuarioUpdate_Click(object sender, EventArgs e)
        //{
        //    unCliente = (UsuarioEntidad)Session["Cliente"];
        //    unCliente.Permisos.Clear();
        //    unCliente.Permisos.Add(new Familia());
        //    unCliente.Permisos[0].IdIFamPat = ddlPermisosUsuarioUpdate.SelectedIndex + 1;
        //    unManagerUsuarioFamilia.UsuarioUpdatePermisosFamilia(unCliente);
        //    cargarPermisos();
        //}

        protected void btnCambiarClave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                StringBuilder sb = new StringBuilder();
                unCliente = (UsuarioEntidad)Session["Cliente"];
                unCliente.Clave = ServicioSecurizacion.AplicarHash(txtClave.Value);
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


        public void cargarProvincias(int? elIndice = null)
        {
            ddlProvincia.DataSource = null;
            unasProvincias = unManagerUsuario.SelectALLProvincias();
            ddlProvincia.DataSource = unasProvincias;
            ddlProvincia.DataValueField = "IdProvincia";
            ddlProvincia.DataTextField = "DescripcionProvincia";
            ddlProvincia.DataBind();
            if (elIndice != null)
                ddlProvincia.SelectedIndex = (int)elIndice;
        }


        public void cargarLocalidades()
        {
            ddlLocalidad.DataSource = null;
            ddlLocalidad.DataSource = unasProvincias.Find(X => X.IdProvincia == (Int32.Parse(ddlProvincia.SelectedValue))).misLocalidades;
            ddlLocalidad.DataValueField = "IdLocalidad";
            ddlLocalidad.DataTextField = "DescripcionLocalidad";
            ddlLocalidad.DataBind();
        }

        public void cargarProvinciasEnvio(int? elIndice = null)
        {
            ddlProvinciaEnvio.DataSource = null;
            unasProvinciasEnvio = unManagerUsuario.SelectALLProvincias();
            ddlProvinciaEnvio.DataSource = unasProvinciasEnvio;
            ddlProvinciaEnvio.DataValueField = "IdProvincia";
            ddlProvinciaEnvio.DataTextField = "DescripcionProvincia";
            ddlProvinciaEnvio.DataBind();
            if (elIndice != null)
                ddlProvinciaEnvio.SelectedIndex = (int)elIndice;
        }


        public void cargarLocalidadesEnvio()
        {
            ddlLocalidadEnvio.DataSource = null;
            ddlLocalidadEnvio.DataSource = unasProvinciasEnvio.Find(X => X.IdProvincia == (Int32.Parse(ddlProvinciaEnvio.SelectedValue))).misLocalidades;
            ddlLocalidadEnvio.DataValueField = "IdLocalidad";
            ddlLocalidadEnvio.DataTextField = "DescripcionLocalidad";
            ddlLocalidadEnvio.DataBind();
        }

        protected void btnUpdateFacturacion_Click(object sender, EventArgs e)
        {
            //FACTURACION
            unCliente = (UsuarioEntidad)Current.Session["Cliente"];
            StringBuilder sb = new StringBuilder();
            DireccionEntidad NuevaDireccion = new DireccionEntidad();
            DireccionEntidad DireccionEnvio = new DireccionEntidad();

            NuevaDireccion.IdTipoDireccion = (int)TipoDireccionEntidad.Options.Facturacion;
            NuevaDireccion.Calle = txtCalle.Value;
            NuevaDireccion.Numero = Int32.Parse(txtNumero.Value);
            if (!string.IsNullOrEmpty(txtPiso.Value))
                NuevaDireccion.Piso = Int32.Parse(txtPiso.Value);
            if (!string.IsNullOrEmpty(txtDpartamento.Value))
                NuevaDireccion.Departamento = txtDpartamento.Value;
            NuevaDireccion.miLocalidad = new Localidad();
            NuevaDireccion.miLocalidad.IdLocalidad = Int32.Parse(ddlLocalidad.SelectedValue);
            NuevaDireccion.miLocalidad.miProvincia = new ProvinciaEntidad();
            NuevaDireccion.miLocalidad.miProvincia.IdProvincia = Int32.Parse(ddlProvincia.SelectedValue);
            NuevaDireccion.Predeterminada = true;//Se crea por default como predeterminada

            unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, unCliente);
        }

        protected void btnUpdateEnvio_Click(object sender, EventArgs e)
        {
            //ENVIO
            unCliente = (UsuarioEntidad)Current.Session["Cliente"];
            StringBuilder sb = new StringBuilder();
            DireccionEntidad NuevaDireccion = new DireccionEntidad();
            DireccionEntidad DireccionEnvio = new DireccionEntidad();

            DireccionEnvio.IdTipoDireccion = (int)TipoDireccionEntidad.Options.Envio;
            DireccionEnvio.Calle = txtCalleEnvio.Value;
            DireccionEnvio.Numero = Int32.Parse(txtNumeroEnvio.Value);
            if (!string.IsNullOrEmpty(txtPisoEnvio.Value))
                DireccionEnvio.Piso = Int32.Parse(txtPisoEnvio.Value);
            if (!string.IsNullOrEmpty(txtDepartamentoEnvio.Value))
                DireccionEnvio.Departamento = txtDepartamentoEnvio.Value;
            NuevaDireccion.miLocalidad = new Localidad();
            NuevaDireccion.miLocalidad.IdLocalidad = Int32.Parse(ddlLocalidadEnvio.SelectedValue);
            NuevaDireccion.miLocalidad.miProvincia = new ProvinciaEntidad();
            NuevaDireccion.miLocalidad.miProvincia.IdProvincia = Int32.Parse(ddlProvinciaEnvio.SelectedValue);
            NuevaDireccion.Predeterminada = true;//Se crea por default como predeterminada

            unManagerUsuario.InsertDireccionDeFacturacion(DireccionEnvio, unCliente);
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


        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int aux = Int32.Parse(ddlProvincia.SelectedValue);
            aux--;
            cargarProvincias(aux);
            cargarLocalidades();
        }

        protected void ddlProvinciaEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            int aux = Int32.Parse(ddlProvinciaEnvio.SelectedValue);
            aux--;
            cargarProvinciasEnvio(aux);
            cargarLocalidadesEnvio();
        }




    }
}