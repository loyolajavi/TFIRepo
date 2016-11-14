using System;
using System.Collections.Generic;

namespace TFI.Entidades
{
    public class PedidoEntidad
    {
        public int IdPedido { get; set; }
        public DateTime FechaPedido { get; set; }
        public DateTime? FechaFinPedido { get; set; }
        public string NombreUsuario { get; set; }
        public int? PlazoEntrega { get; set; }
        public int IdFormaEntrega { get; set; }
        public string CUIT { get; set; }
        public string NumeroTracking { get; set; }
        public int DireccionEntrega { get; set; }
        public DateTime? FecBaja { get; set; }
        public Int64 NroPedido { get; set; }

        public EstadoPedidoEntidad Estado { get; set; }
        public List<PedidoDetalleEntidad> Detalles { get; set; }
    }
}