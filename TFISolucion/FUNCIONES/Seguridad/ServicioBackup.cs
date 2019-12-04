using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using TFI.Entidades;
using TFI.FUNCIONES.Persistencia;

namespace TFI.SEGURIDAD
{
    public class ServicioBackup
    {
        public static bool Respaldar(string Nombre, string Destino, string Obser)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            HttpContext Current = HttpContext.Current;

            Destino = Destino + "\\" + Nombre + ".bak";

            SqlParameter[] parameters = new SqlParameter[]
			{
                new SqlParameter("@Nombre", Nombre),
                new SqlParameter("@Destino", Destino),
                new SqlParameter("@Obser", Obser)
			};

            
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            try
            {
                if (!usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == "Admin"))
                    throw new InvalidOperationException("No posee los permisos suficientes");
                SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "BaseDatosRespaldar", parameters);
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }




        public static bool Restaurar(string Nombre, string Ubicacion)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            HttpContext Current = HttpContext.Current;
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            try
            {
                if (usuarioAutenticado == null)
                    return false;
                if (!usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == "Admin"))
                    throw new InvalidOperationException("No posee los permisos suficientes");

                if (!string.IsNullOrWhiteSpace(Nombre) && !string.IsNullOrWhiteSpace(Ubicacion))
                {
                    string stringPararProcesos = "DECLARE @ProcessId varchar(4) " + Environment.NewLine + "DECLARE CurrentProcesses SCROLL CURSOR FOR" + Environment.NewLine +
                "select spid from sysprocesses where dbid = (select dbid from sysdatabases where name = 'ECommerce' ) order by spid " + Environment.NewLine +
                "FOR READ ONLY" + Environment.NewLine + "OPEN CurrentProcesses" + Environment.NewLine + "FETCH NEXT FROM CurrentProcesses INTO @ProcessId" +
                Environment.NewLine + "WHILE @@FETCH_STATUS <> -1" + Environment.NewLine + "BEGIN" + Environment.NewLine + "	Exec ('KILL ' +  @ProcessId)" +
                Environment.NewLine + "	FETCH NEXT FROM CurrentProcesses INTO @ProcessId" + Environment.NewLine + "                    End" + Environment.NewLine +
                "CLOSE CurrentProcesses" + Environment.NewLine + "DeAllocate CurrentProcesses";

                    string stringRestaurar = "RESTORE DATABASE " + Nombre + " FROM DISK = '" + Ubicacion + "' WITH REPLACE, RECOVERY";

                    //FRAMEWORK.Persistencia.MotorBD.ConexionIniciarParaRestauracion();
                    //string connectionStringNameRest;
                    //if (ConfiguracionBase[1].UsuarioBD != null && !string.IsNullOrEmpty(ConfiguracionBase[1].UsuarioBD))
                    //    connectionStringNameRest = ConfiguracionBase[1].DataSourceBD + ConfiguracionBase[1].InitialCatalogBD + ConfiguracionBase[1].UsuarioBD + ConfiguracionBase[1].PasswordBD;
                    //else
                    //    connectionStringNameRest = ConfiguracionBase[1].DataSourceBD + ConfiguracionBase[1].InitialCatalogBD + ConfiguracionBase[1].SSPI;
                    SqlClientUtility.ExecuteNonQueryRestaurar(CommandType.Text, stringPararProcesos);
                    SqlClientUtility.ExecuteNonQueryRestaurar(CommandType.Text, stringRestaurar);
                    //FRAMEWORK.Persistencia.MotorBD.EjecutarNonQuery(CommandType.Text, stringPararProcesos);
                    //FRAMEWORK.Persistencia.MotorBD.EjecutarNonQuery(CommandType.Text, stringRestaurar);
                    return true;
                }
                return false;

            }
            catch (Exception es)
            {
                throw;
            }
        }





    }
}
