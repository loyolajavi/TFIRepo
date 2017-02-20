using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.Repositories;
using TFI.Entidades;
using Newtonsoft.Json;

namespace TFI.CORE.Managers
{
   public class GraficoCore
    {
       private GraficoDAL DalGrafico = new GraficoDAL();

       public List<GraficoProductoPorCategoria> SelectAllProductosPorCategoria()
       {

        return DalGrafico.SelectAll(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);

       }

       public List<GraficoVentasPeriodo> SelectAllVentasPeriodo()
       {

           return DalGrafico.SelectVentasPeriodo(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);

       }

       public List<Graficos5Productosmasvendidos> SelectProductosMasVendidos()
       {

           return DalGrafico.SelectProductosMasVendidos(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);

       }

       public List<GraficoMontoVentas> SelectMontoVentas()
       {

           return DalGrafico.SelectMontoVentas(TFI.CORE.Helpers.ConfigSection.Default.Site.Cuit);

       }
    }
}
