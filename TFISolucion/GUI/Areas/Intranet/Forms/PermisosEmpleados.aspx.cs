﻿using System;
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
    public partial class PermisosEmpleados : System.Web.UI.Page
    {


        public List<UsuarioEntidad> unosEmpleados = new List<UsuarioEntidad>();
        private UsuarioCore managerEmpleado = new UsuarioCore();

        protected void Page_Load(object sender, EventArgs e)
        {

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