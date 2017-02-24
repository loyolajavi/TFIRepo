using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using System.Text;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class PermisosClientes : BasePage
    {
        public List<UsuarioEntidad> unosClientes = new List<UsuarioEntidad>();
        private UsuarioCore managerCliente = new UsuarioCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
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
            

            if (!IsPostBack)
            {
                cargarClientes();
            }

        }

        protected void btnEliminarUsuario_Click(object sender, EventArgs e)
        {

            if (CheckAllUsuarios.Checked && CheckAllUsuarios.Value == "Y")
            {
                managerCliente.DeleteAllByIdUsuarioTipo(1);//Clientes
            }

            foreach (RepeaterItem item in rptClientes.Items)
            {


                var unCheckBox = (System.Web.UI.HtmlControls.HtmlInputCheckBox)item.FindControl("chbIdUsuarios");

                if (unCheckBox.Checked)
                {
                    managerCliente.UsuarioDeleteSeleccionadosByIdUsuario(Int32.Parse(unCheckBox.Attributes["value"]));
                }
            }
            cargarClientes();
        }


        public void cargarClientes()
        {
            unosClientes = managerCliente.UsuarioSelectAllByIdUsuarioTipo_CUIT(1);
            rptClientes.DataSource = null;
            rptClientes.DataSource = unosClientes;
            rptClientes.DataBind();
        }

    }
}