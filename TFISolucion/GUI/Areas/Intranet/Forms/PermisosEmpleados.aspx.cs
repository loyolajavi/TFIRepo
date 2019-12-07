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
    public partial class PermisosEmpleados : BasePage
    {


        public List<UsuarioEntidad> unosEmpleados = new List<UsuarioEntidad>();
        private UsuarioCore managerEmpleado = new UsuarioCore();
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

            string[] unosPermisosTest = new string[] { "GestionEmpleados" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            //unosPermisosTest = new string[] { "Empleado" };
            //if (this.Master.Autenticar(unosPermisosTest))
            //{
            //    Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            //}

            if (!IsPostBack)
            {
                cargarEmpleados();
            }

        }

        protected void btnEliminarUsuario_Click(object sender, EventArgs e)
        {

            if (CheckAllUsuarios.Checked && CheckAllUsuarios.Value == "Y")
            {
                managerEmpleado.DeleteAllByIdUsuarioTipo(2);//Empleados
            }

            foreach (RepeaterItem item in rptEmpleados.Items)
            {


                var unCheckBox = (System.Web.UI.HtmlControls.HtmlInputCheckBox)item.FindControl("chbIdUsuarios");

                if (unCheckBox.Checked)
                {
                    managerEmpleado.UsuarioDeleteSeleccionadosByIdUsuario(Int32.Parse(unCheckBox.Attributes["value"]));
                }
            }
            cargarEmpleados();
        }

        public void cargarEmpleados()
        {
            unosEmpleados = managerEmpleado.UsuarioSelectAllByIdUsuarioTipo_CUIT(2);
            rptEmpleados.DataSource = null;
            rptEmpleados.DataSource = unosEmpleados;
            rptEmpleados.DataBind();
        }
    }
}