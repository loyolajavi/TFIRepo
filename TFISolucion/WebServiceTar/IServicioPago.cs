using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WebServiceTar
{
    [ServiceContract]
    public interface IServicioPago
    {

        [OperationContract]
        bool ProcesarPago(string elNroTarjeta, decimal elMonto);

        
    }


}
