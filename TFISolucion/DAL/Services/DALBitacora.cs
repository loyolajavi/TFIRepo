using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.Entidades;
using TFI.FUNCIONES.Persistencia;

namespace TFI.DAL.Services
{
    public class DALBitacora
    {
        public List<BitacoraLogEntidad> BitacoraVerLogs(string unTipoLog, DateTime? fechaInicio = null, DateTime? fechaFin = null)
        {

            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@TipoLog", unTipoLog));
            if (fechaInicio != DateTime.MinValue)
                parameters.Add(new SqlParameter("@fechaInicio", fechaInicio));
            if (fechaFin != DateTime.MinValue)
                parameters.Add(new SqlParameter("@fechaFin", fechaFin));


            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "BitacoraVerLogs", parameters.ToArray()))
            {
                List<BitacoraLogEntidad> unaLista = new List<BitacoraLogEntidad>();
                unaLista = MapearBitacoraLogs(ds);
                return unaLista;
            }
        }


        public List<BitacoraLogEntidad> MapearBitacoraLogs(DataSet ds)
        {
            List<BitacoraLogEntidad> ResLogs = new List<BitacoraLogEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    BitacoraLogEntidad unLog = new BitacoraLogEntidad();

                    unLog.IdBitacoraLog = (int)row["IdBitacoraLog"];
                    unLog.CUIT = row["CUIT"].ToString();
                    unLog.NombreUsuario = row["NombreUsuario"].ToString();
                    unLog.Fecha = DateTime.Parse(row["Fecha"].ToString());
                    unLog.TipoLog = row["TipoLog"].ToString();
                    unLog.Accion = row["Accion"].ToString();
                    unLog.Mensaje = row["Mensaje"].ToString();
                    ResLogs.Add(unLog);
                }
                return ResLogs;
            }
            catch (Exception es)
            {
                throw;
            }
        }


    }
}
