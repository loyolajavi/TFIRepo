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
   public class ReporteDAL
    {

        /// <summary>
        /// Selects all records from the Direccion table.
        /// </summary>
       public List<ReportePedidosPorFechayEstado> ReportePedidosPorFechayEstado(string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
				
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReportePedidosPorFechayEstado",parameters))
            {
                List<ReportePedidosPorFechayEstado> lista = new List<ReportePedidosPorFechayEstado>();

                lista = Mapeador.Mapear<ReportePedidosPorFechayEstado>(dt);

                return lista;
            }
        }

       public List<ReportePedidosDeUsuario> ReportePedidosDeUsuario(string CUIT,string usuario)
       {
           SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@Usuario", usuario)
			};

           using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReportePedidosDeUsuario", parameters))
           {
               List<ReportePedidosDeUsuario> lista = new List<ReportePedidosDeUsuario>();

               lista = Mapeador.Mapear<ReportePedidosDeUsuario>(dt);

               return lista;
           }
       }
    }
}
