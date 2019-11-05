using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

using TFI.HelperDAL;


namespace TFI.DAL.Services
{
    public class ServicioMailDAL
    {

        public static void CargarMailConfig()
        {
            try
            {

                using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ConfigMailHostTraer"))
                {

                    foreach (DataRow row in dt.Rows)
                    {
                        TFI.FUNCIONES.ServicioMail.Puerto = (int)row["Puerto"];
                        TFI.FUNCIONES.ServicioMail.Host = row["Host"].ToString();
                        TFI.FUNCIONES.ServicioMail.ssl = (bool)row["Ssl"];
                        TFI.FUNCIONES.ServicioMail.remitente = row["Remitente"].ToString();
                        TFI.FUNCIONES.ServicioMail.remps = row["Remps"].ToString();
                        TFI.FUNCIONES.ServicioMail.remps = TFI.SEGURIDAD.ServicioSecurizacion.Desencriptar(TFI.FUNCIONES.ServicioMail.remps);
                        if (string.IsNullOrEmpty(TFI.FUNCIONES.ServicioMail.remitente = row["Remitente"].ToString()))
                            throw new Exception("Se debe registrar la dirección del remitente");
                    }
                }
            }
            catch (Exception es)
            {
                throw;
            }
        }




        public void ModificarMailConfig(string unMail, string unPass, int unPuerto, string unHost, bool unSSL)
        {
            //SqlParameter[] parameters = new SqlParameter[]
            //{
            //    new SqlParameter("@unMail", unMail),
            //    new SqlParameter("@unPass", unPass),
            //    new SqlParameter("@unPuerto", unPuerto),
            //    new SqlParameter("@unHost", unHost),
            //    new SqlParameter("@unSSL", unSSL)

            //};

            //try
            //{
            //    FRAMEWORK.Persistencia.MotorBD.ConexionIniciar();
            //    FRAMEWORK.Persistencia.MotorBD.TransaccionIniciar();
            //    FRAMEWORK.Persistencia.MotorBD.EjecutarNonQuery(CommandType.StoredProcedure, "ModificarMailConfig", parameters);
            //    FRAMEWORK.Persistencia.MotorBD.TransaccionAceptar();
            //}
            //catch (Exception es)
            //{
            //    FRAMEWORK.Persistencia.MotorBD.TransaccionCancelar();
            //    throw;
            //}
            //finally
            //{
            //    if (FRAMEWORK.Persistencia.MotorBD.ConexionGetEstado())
            //        FRAMEWORK.Persistencia.MotorBD.ConexionFinalizar();
            //}
        }

    }
}
