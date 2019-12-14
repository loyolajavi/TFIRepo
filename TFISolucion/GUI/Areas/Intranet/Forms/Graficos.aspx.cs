using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE;
using TFI.Entidades;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class Graficos : BasePage
    {

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

        [WebMethod]
        public static List<GraficoProductoPorCategoria> GetChartData()
        {
            TFI.CORE.Managers.GraficoCore GraficoCore = new CORE.Managers.GraficoCore();
            return GraficoCore.SelectAllProductosPorCategoria();
        }

        [WebMethod]
        public static List<GraficoVentasPeriodo> GetChartData1()
        {
            TFI.CORE.Managers.GraficoCore GraficoCore = new CORE.Managers.GraficoCore();
            return GraficoCore.SelectAllVentasPeriodo();
        }

        [WebMethod]
        public static List<Graficos5Productosmasvendidos> GetChartData2()
        {
            TFI.CORE.Managers.GraficoCore GraficoCore = new CORE.Managers.GraficoCore();
            return GraficoCore.SelectProductosMasVendidos();
        }

        [WebMethod]
        public static List<GraficoMontoVentas> GetChartData3()
        {
            TFI.CORE.Managers.GraficoCore GraficoCore = new CORE.Managers.GraficoCore();
            return GraficoCore.SelectMontoVentas();
        }
    }
}