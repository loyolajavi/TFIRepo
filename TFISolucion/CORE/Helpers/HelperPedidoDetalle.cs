using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.Entidades;

namespace TFI.CORE.Helpers
{
    public class HelperPedidoDetalle
    {
        public HelperPedidoDetalle()
        {
            Pedido = new PedidoEntidad();
            lPedidoDetalle = new List<PedidoDetalleEntidad>();
        }

        public PedidoEntidad Pedido { get; set; }
        public List<PedidoDetalleEntidad> lPedidoDetalle { get; set; }

    }
}