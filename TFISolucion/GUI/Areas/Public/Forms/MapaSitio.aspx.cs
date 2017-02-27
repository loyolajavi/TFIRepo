using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class MapaSitio : BasePage
    {
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

        public MapaSitio()
        {
            idioma = new LenguajeEntidad();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
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
            }
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }

        }
    }
}