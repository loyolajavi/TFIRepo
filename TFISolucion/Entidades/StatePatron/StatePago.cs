using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.StatePatron
{
    public class StatePago : StatePedido
    {
        private static StatePedido _State = new StatePago();

        private StatePago() { }


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
            base.CambiarEstado(elPedido, StateEnCamino.Instanciar());
        }

        public override void HaciaListoParaRetirar(PedidoEntidad elPedido)
        {
            base.CambiarEstado(elPedido, StateListoParaRetirar.Instanciar());
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
