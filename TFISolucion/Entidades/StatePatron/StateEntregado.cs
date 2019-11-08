using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.StatePatron
{

    public class StateEntregado : StatePedido
    {
        private static StatePedido _State = new StateEntregado();

        private StateEntregado() { }


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
            
        }

        public override void HaciaCancelado(PedidoEntidad elPedido)
        {
            base.CambiarEstado(elPedido, StateCancelado.Instanciar());
        }
    }
}
