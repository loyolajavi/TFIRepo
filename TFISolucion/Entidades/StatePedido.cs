using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades
{
    public abstract class StatePedido
    {

        protected StatePedido(){}

        public abstract void HaciaPendienteDePago(PedidoEntidad elPedido);
        public abstract void HaciaPago(PedidoEntidad elPedido);
        public abstract void HaciaEnCamino(PedidoEntidad elPedido);
        public abstract void HaciaListoParaRetirar(PedidoEntidad elPedido);
        public abstract void HaciaEntregado(PedidoEntidad elPedido);
        public abstract void HaciaCancelado(PedidoEntidad elPedido);

        protected void CambiarEstado(PedidoEntidad elPedido, StatePedido elState)
        {
            elPedido.CambiarEstado(elState);
        }

    }
}
