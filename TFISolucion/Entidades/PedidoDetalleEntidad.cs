using System;

namespace TFI.Entidades
{
    [Serializable]
    public class PedidoDetalleEntidad
    {
        public int IdPedidoDetalle { get; set; }
        public int IdPedido { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public ProductoEntidad miProducto { get; set; }
        public DateTime? FecBaja { get; set; }
        public string CUIT { get; set; }

        public PedidoEntidad Pedido { get; set; }
    }
}