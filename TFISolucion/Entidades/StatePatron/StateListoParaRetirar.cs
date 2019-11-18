using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.StatePatron
{

    [Serializable]
    public class StateListoParaRetirar : StatePedido
    {
        public override void SiguientePaso(PedidoEntidad unPedido, bool Cancela, int laFormaEnvio)
        {
            if (Cancela)
                unPedido.DefinirEstado(new StateCancelado());
            else
                unPedido.DefinirEstado(new StateEntregado());
        }

        //private static StatePedido _State = new StateListoParaRetirar();

        //private StateListoParaRetirar() { }


        //public static StatePedido Instanciar()
        //{
        //    return _State;
        //}

        //public override void HaciaPendienteDePago(PedidoEntidad elPedido)
        //{
            
        //}

        //public override void HaciaPago(PedidoEntidad elPedido)
        //{
            
        //}

        //public override void HaciaEnCamino(PedidoEntidad elPedido)
        //{
            
        //}

        //public override void HaciaListoParaRetirar(PedidoEntidad elPedido)
        //{
            
        //}

        //public override void HaciaEntregado(PedidoEntidad elPedido)
        //{
        //    base.CambiarEstado(elPedido, StateEntregado.Instanciar());
        //}

        //public override void HaciaCancelado(PedidoEntidad elPedido)
        //{
        //    base.CambiarEstado(elPedido, StateCancelado.Instanciar());
        //}

    }
}
