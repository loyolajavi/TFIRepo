using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades
{
    [Serializable]
    public abstract class StatePedido
    {
        public int IdEstadoPedido { get; set; }
        public string DescripcionEstadoPedido { get; set; }
        //protected StatePedido(){}

        //public abstract void HaciaPendienteDePago(PedidoEntidad elPedido);
        //public abstract void HaciaPago(PedidoEntidad elPedido);
        //public abstract void HaciaEnCamino(PedidoEntidad elPedido);
        //public abstract void HaciaListoParaRetirar(PedidoEntidad elPedido);
        //public abstract void HaciaEntregado(PedidoEntidad elPedido);
        //public abstract void HaciaCancelado(PedidoEntidad elPedido);

        //protected void CambiarEstado(PedidoEntidad elPedido, StatePedido elState)
        //{
        //    elPedido.CambiarEstado(elState);
        //}

        public abstract void SiguientePaso(PedidoEntidad unPedido, bool Cancela, int laFormaEnvio);

        
        //public enum Estado : int
        //{
        //    PendientePago = 1, Pago = 2, EnCamino = 3, ListoRetirar = 4, Entregado = 5, Cancelado = 6
        //}

    }
}
