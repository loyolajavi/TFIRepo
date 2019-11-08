using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.StatePatron
{

    public class StateListoParaRetirar : StatePedido
    {
        private static StatePedido _State = new StateListoParaRetirar();

        private StateListoParaRetirar() { }


        public static StatePedido Instanciar()
        {
            return _State;
        }

        public override void HaciaPendienteDePago(PedidoEntidad elPedido)
        {
            
        }

        public override void HaciaPago(PedidoEntidad elPedido)
        {
            
        }

        public override void HaciaEnCamino(PedidoEntidad elPedido)
        {
            
        }

        public override void HaciaListoParaRetirar(PedidoEntidad elPedido)
        {
            
        }

        public override void HaciaEntregado(PedidoEntidad elPedido)
        {
            base.CambiarEstado(elPedido, StateEntregado.Instanciar());
        }

        public override void HaciaCancelado(PedidoEntidad elPedido)
        {
            base.CambiarEstado(elPedido, StateCancelado.Instanciar());
        }
    }
}
