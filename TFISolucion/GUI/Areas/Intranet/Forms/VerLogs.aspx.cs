using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;
using TFI.Entidades;
using TFI.CORE.Servicios;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class VerLogs : System.Web.UI.Page
    {

        List<BitacoraLogEntidad> unosLogs = new List<BitacoraLogEntidad>();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        BLLBitacora ManagerBitacora = new BLLBitacora();

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

            string[] unosPermisosTest = new string[] { "Publico", "Cliente" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            unosPermisosTest = new string[] { "Empleado" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Intranet/Forms/OrdenesPedido.aspx");
            }

         

        }

        protected void btnFiltrarLogs_Click(object sender, EventArgs e)
        {

            unosLogs = ManagerBitacora.BitacoraVerLogs(idelTIpoLog.Value, DateTime.Parse(elIdFechaInicio.Value), DateTime.Parse(elIdFechaFin.Value));
            grillaLogs.DataSource = null;
            grillaLogs.DataSource = unosLogs;
            grillaLogs.DataBind();
        }

        protected void grillaLogs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grillaLogs.PageIndex = e.NewPageIndex;
            unosLogs = ManagerBitacora.BitacoraVerLogs(idelTIpoLog.Value, DateTime.Parse(elIdFechaInicio.Value), DateTime.Parse(elIdFechaFin.Value));
            grillaLogs.DataSource = null;
            grillaLogs.DataSource = unosLogs;
            grillaLogs.DataBind();
        }
    }
}