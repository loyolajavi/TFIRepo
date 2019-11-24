using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.Entidades;
using TFI.FUNCIONES.Persistencia;

namespace TFI.DAL.Repositories
{
   public class GraficoDAL
    {
        /// <summary>
        /// Selects all records from the Producto table.
        /// </summary>
       public List<GraficoProductoPorCategoria> SelectAll(string CUIT)
        {

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};


            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "GraficoProductosPorCategoria", parameters))
            {
                List<GraficoProductoPorCategoria> grafico = new List<GraficoProductoPorCategoria>();
                grafico = Mapeador.Mapear<GraficoProductoPorCategoria>(dt);

                return grafico;
            }
        }

       public List<GraficoVentasPeriodo> SelectVentasPeriodo(string CUIT)
       {

           SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};


           using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "GraficoVentasPeriodo", parameters))
           {
               List<GraficoVentasPeriodo> grafico = new List<GraficoVentasPeriodo>();
               grafico = Mapeador.Mapear<GraficoVentasPeriodo>(dt);

               return grafico;
           }
       }

       public List<Graficos5Productosmasvendidos> SelectProductosMasVendidos(string CUIT)
       {

           SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};


           using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "Grafico5productosmasvendidos", parameters))
           {
               List<Graficos5Productosmasvendidos> grafico = new List<Graficos5Productosmasvendidos>();
               grafico = Mapeador.Mapear<Graficos5Productosmasvendidos>(dt);

               return grafico;
           }
       }

       public List<GraficoMontoVentas> SelectMontoVentas(string CUIT)
       {

           SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};


           using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "GraficoMontoVentas", parameters))
           {
               List<GraficoMontoVentas> grafico = new List<GraficoMontoVentas>();
               grafico = Mapeador.Mapear<GraficoMontoVentas>(dt);

               return grafico;
           }
       }
    }
}
