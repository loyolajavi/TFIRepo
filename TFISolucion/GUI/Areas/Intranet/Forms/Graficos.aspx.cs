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
        protected void Page_Load(object sender, EventArgs e)
        {

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