using System;

namespace TFI.Entidades
{
    [Serializable]
	public class EstadoPedidoEntidad
	{
        public enum Options
        {
            PendientePago = 1,
            Pago = 2,
            EnCamino = 3,
            ListoRetirar = 4,
            Entregado = 5,
            Cancelado = 6
        }


		public int IdEstadoPedido { get; set; }
		public string DescripcionEstadoPedido { get; set; }
		public DateTime? FecBaja { get; set; }

	}
}
