using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.Entidades;
using TFI.DAL.Services;

namespace TFI.CORE.Servicios
{
    public class BLLBitacora
    {

        DALBitacora GestorBitacora = new DALBitacora();

        public List<BitacoraLogEntidad> BitacoraVerLogs(string unTipoLog, DateTime? fechaInicio = null, DateTime? fechaFin = null)
        {
            try
            {
                return GestorBitacora.BitacoraVerLogs(unTipoLog, fechaInicio, fechaFin);
            }
            catch (Exception es)
            {
                throw;
            }
        }

    }
}
