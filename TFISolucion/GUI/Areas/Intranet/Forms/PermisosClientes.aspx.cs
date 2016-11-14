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
    public partial class PermisosClientes : System.Web.UI.Page
    {
        public List<UsuarioEntidad> unosClientes = new List<UsuarioEntidad>();
        private UsuarioCore managerCliente = new UsuarioCore();

        protected void Page_Load(object sender, EventArgs e)
        {

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