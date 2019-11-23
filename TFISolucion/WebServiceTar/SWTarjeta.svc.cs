using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WebServiceTar
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class SWTarjeta : IServicioPago
    {

        public bool ProcesarPago(string elNroTarjeta, decimal elMonto)
        {
            Random ran = new Random();
            double unnro = ran.NextDouble();
            //bool hola = ran.NextDouble() < 20.0 / 100.0;
            if (unnro < (70.0 / 100.0))
                return true;
            return false;
        }
    }
}
