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
using TFI.Entidades.Servicios.Permisos;
using TFI.SEGURIDAD;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class RegistroCliente : BasePage
    {
        private LenguajeEntidad idioma;
        public List<CondicionFiscalEntidad> unosFiscales = new List<CondicionFiscalEntidad>();
        private CondicionFiscalCore unManagerFiscal = new CondicionFiscalCore();
        private UsuarioCore unManagerUsuario = new UsuarioCore();
        public UsuarioEntidad unUsuario = new UsuarioEntidad();
        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();
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

        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                cargarFiscal();
                cargarProvincias();
                cargarLocalidades();


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


        public void cargarProvincias(int? elIndice = null)
        {
            ddlProvincia.DataSource = null;
            unasProvincias = unManagerUsuario.SelectALLProvincias();
            ddlProvincia.DataSource = unasProvincias;
            ddlProvincia.DataValueField = "IdProvincia";
            ddlProvincia.DataTextField = "DescripcionProvincia";
            ddlProvincia.DataBind();
            if(elIndice != null)
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


        protected void btnAltaCliente_Click(object sender, EventArgs e)
        {

            var NroRetorno = 0;
            StringBuilder sb = new StringBuilder();
            DireccionEntidad NuevaDireccion = new DireccionEntidad();

            if (Page.IsValid)
            {

                unUsuario.IdUsuarioTipo = 1;//Cliente
                unUsuario.NombreUsuario = txtNombreUsuario.Value;
                unUsuario.Clave = ServicioSecurizacion.AplicarHash(txtClave.Value);
                unUsuario.Apellido = txtApellido.Value;
                unUsuario.Nombre = txtNombre.Value;
                unUsuario.Email = txtMail.Value;
                unUsuario.IdCondicionFiscal = ddlFiscal.SelectedIndex + 1;
                unUsuario.NroIdentificacion = txtDNICUIT.Value;
                unUsuario.Permisos.Add(new Familia());
                unUsuario.Permisos[0].IdIFamPat = (int)FamiliaEntidad.PermisoFamilia.Cliente;
                unUsuario.CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit;


                NroRetorno = unManagerUsuario.RegistrarUsuario(unUsuario);

                //Direccion
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

                //Facturacion
                unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, unUsuario);
                //Envio
                NuevaDireccion.IdTipoDireccion = (int)TipoDireccionEntidad.Options.Envio;
                unManagerUsuario.InsertDireccionDeFacturacion(NuevaDireccion, unUsuario);


                if (NroRetorno == 0)
                {
                    Session["Usuario"] = unUsuario;
                    Response.Redirect("/Areas/Public/Forms/Home.aspx");
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
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int aux = Int32.Parse(ddlProvincia.SelectedValue);
            aux--;
            cargarProvincias(aux);
            cargarLocalidades();
        }





    }
}