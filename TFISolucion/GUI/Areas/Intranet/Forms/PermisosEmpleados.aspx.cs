using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class PermisosEmpleados : System.Web.UI.Page
    {


        public List<UsuarioEntidad> unosEmpleados = new List<UsuarioEntidad>();
        private UsuarioCore managerEmpleado;

        protected void Page_Load(object sender, EventArgs e)
        {

             managerEmpleado = new UsuarioCore();
            
            unosEmpleados = managerEmpleado.UsuarioSelectAllByIdUsuarioTipo_CUIT(1);
            rptEmpleados.DataSource = unosEmpleados;
            rptEmpleados.DataBind();



        }
    }
}