using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.StatePatron
{
    [Serializable]
    public class StatePendientePago : StatePedido
    {
        //private static StatePedido _State = new StatePendientePago();

        //private StatePendientePago() { }


        //public static StatePedido Instanciar()
        //{
        //    return _State;
        //}

        public override void SiguientePaso(PedidoEntidad unPedido, bool Cancela, int laFormaEnvio)
        {
            if(Cancela)
                unPedido.DefinirEstado(new StateCancelado());
            else
                unPedido.DefinirEstado(new StatePago());
        }
    }
}
