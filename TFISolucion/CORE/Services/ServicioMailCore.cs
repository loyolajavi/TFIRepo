using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL;

namespace TFI.CORE.Services
{
    public class ServicioMailCore
    {

        DAL.Services.ServicioMailDAL GestorServicioMail = new DAL.Services.ServicioMailDAL();

        public static void CargarMailConfig()
        {
            try
            {
                DAL.Services.ServicioMailDAL.CargarMailConfig();
            }
            catch (Exception es)
            {
                throw;
            }

        }

        public void ModificarMailConfig(string unMail, string unPass, int unPuerto, string unHost, bool unSSL)
        {
            //try
            //{
            //    if (!BLLFamilia.BuscarPermiso(FRAMEWORK.Servicios.ServicioLogin.GetLoginUnico().UsuarioLogueado.Permisos, new string[] { "Mail Modificar" }))
            //        throw new InvalidOperationException("No posee los permisos suficientes");
            //    GestorServicioMail.ModificarMailConfig(unMail, unPass, unPuerto, unHost, unSSL);
            //}
            //catch (Exception es)
            //{
            //    throw;
            //}
        }

    }
}
