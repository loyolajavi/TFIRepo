using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia;
using TFI.Entidades;

namespace TFI.DAL.DAL
{
    public class AdquisicionDAL
    {

        public int Insert(Adquisicion laAdquisicion)
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
		        {
			        new SqlParameter("@CUIT", laAdquisicion.CUIT),
			        new SqlParameter("@IdSucursal", laAdquisicion.miSucursal.IdSucursal),
			        new SqlParameter("@NroRemito", laAdquisicion.NroRemito),
                    new SqlParameter("@Fecha", laAdquisicion.miFecha)
		        };
                var result = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "AdquisicionInsert", parameters);
                return Decimal.ToInt32(result);
            }
            catch (Exception)
            {
                throw;
            }
        }


        public void InsertDetalles(Adquisicion laAdquisicion)
        {
            try
            {
                foreach (AdquisicionDetalle item in laAdquisicion.MisAdqDetalles)
                {
                    SqlParameter[] parameters = new SqlParameter[]
		            {
			            new SqlParameter("@IdAdquisicion", laAdquisicion.IdAdquisicion),
                        new SqlParameter("@IdProducto", item.miProducto.IdProducto),
                        new SqlParameter("@Cantidad", item.Cantidad),
                        new SqlParameter("@Ajuste", item.Ajuste),
                        new SqlParameter("@CUIT", laAdquisicion.CUIT)
		            };

                    SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "AdquisicionDetalleInsert", parameters);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


    }
}
