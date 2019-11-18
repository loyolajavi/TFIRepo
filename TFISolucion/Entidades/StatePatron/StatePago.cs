using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.StatePatron
{
    [Serializable]
    public class StatePago : StatePedido
    {
        //private static StatePedido _State = new StatePago();

        //private StatePago() { }


        //public static StatePedido Instanciar()
        //{
        //    return _State;
        //}

        public override void SiguientePaso(PedidoEntidad unPedido, bool Cancela, int laFormaEnvio)
        {
            if(Cancela)
                unPedido.DefinirEstado(new StateCancelado());
            else
            {
                if(laFormaEnvio == (int)FormaEntregaEntidad.Options.Correo)
                    unPedido.DefinirEstado(new StateEnCamino());
                else
                    unPedido.DefinirEstado(new StateListoParaRetirar());
            }
        }
    }
}
