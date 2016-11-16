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
    public partial class GestionPermisos : System.Web.UI.Page
    {

        UsuarioEntidad usuarioentidad = new UsuarioEntidad();


        protected void Page_Load(object sender, EventArgs e)
        {

            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null || this.Master.Autenticacion() <= FamiliaEntidad.PermisoFamilia.Cliente)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }

        }
    }
}