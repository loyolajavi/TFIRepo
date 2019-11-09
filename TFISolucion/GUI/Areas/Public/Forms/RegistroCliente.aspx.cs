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
using System.Web.Services;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class RegistroCliente : BasePage
    {
        private LenguajeEntidad idioma;
        public List<CondicionFiscalEntidad> unosFiscales = new List<CondicionFiscalEntidad>();
        private CondicionFiscalCore unManagerFiscal = new CondicionFiscalCore();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        public UsuarioEntidad unUsuario = new UsuarioEntidad();
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
        public RegistroCliente()
        {
            idioma = new LenguajeEntidad();
        }

        //Para mantener la sesión activa
        [WebMethod(EnableSession = true)]
        public static void MantenerSesion()
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                cargarFiscal();
                cargarProvincias();


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
            }
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }
        }



        public void cargarFiscal()
        {
            ddlFiscal.DataSource = null;
            unosFiscales = unManagerFiscal.CondicionFiscalSelectAll();
            ddlFiscal.DataSource = unosFiscales;
            ddlFiscal.DataValueField = "Descripcion";
            ddlFiscal.DataBind();
        }


        public void cargarProvincias()
        {
            ddlProvincia.DataSource = null;
            ddlProvincia.DataSource = unManagerUsuario.SelectALLProvincias();
            ddlProvincia.DataValueField = "IdProvincia";
            ddlProvincia.DataTextField = "DescripcionProvincia";
            ddlProvincia.DataBind();
        }


        protected void btnAltaCliente_Click(object sender, EventArgs e)
        {

            var NroRetorno = 0;
            StringBuilder sb = new StringBuilder();
            DireccionEntidad NuevaDireccion = new DireccionEntidad();
            DireccionUsuarioEntidad NuevaIntermedia = new DireccionUsuarioEntidad();

            if (Page.IsValid)
            {

                unUsuario.IdUsuarioTipo = 1;//Cliente
                unUsuario.NombreUsuario = txtNombreUsuario.Value;
                unUsuario.Clave = Encriptacion.ToHash(txtClave.Value);
                unUsuario.Apellido = txtApellido.Value;
                unUsuario.Nombre = txtNombre.Value;
                unUsuario.Email = txtMail.Value;
                unUsuario.IdCondicionFiscal = ddlFiscal.SelectedIndex + 1;
                unUsuario.NroIdentificacion = txtDNICUIT.Value;
                unUsuario.Familia.IdFamilia = FamiliaEntidad.PermisoFamilia.Cliente;


                NroRetorno = unManagerUsuario.RegistrarUsuario(unUsuario);

                //Direccion
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

                //Facturacion
                unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, NuevaIntermedia);
                //Envio
                NuevaDireccion.IdTipoDireccion = 2;//Envío
                unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, NuevaIntermedia);


                if (NroRetorno == 0)
                {
                    Session["Usuario"] = unUsuario;
                    Response.Redirect("Home.aspx");
                    limpiarCampos();
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
          //  limpiarCampos();
        }

        public void limpiarCampos()
        {
            txtNombreUsuario.Value = string.Empty;
            txtApellido.Value = string.Empty;
            txtNombre.Value = string.Empty;
            txtMail.Value = string.Empty;
            txtDNICUIT.Value = string.Empty;
            ddlFiscal.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;

            txtCalle.Value = string.Empty;
            txtNumero.Value = string.Empty;
            txtPiso.Value = string.Empty;
            txtDpartamento.Value = string.Empty;
            txtLocalidad.Value = string.Empty;
        }





    }
}