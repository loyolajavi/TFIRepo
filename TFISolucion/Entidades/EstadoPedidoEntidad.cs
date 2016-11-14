using System;

namespace TFI.Entidades
{
	public class EstadoPedidoEntidad
	{
        public enum Options
        {
            PendientePago = 1,
            Cancelado = 2,
            Aprobado = 3,
            Autorizado = 4,
            Rechazado = 5,
            Finalizado = 6
        }


		public int IdEstadoPedido { get; set; }
		public string DescripcionEstadoPedido { get; set; }
		public DateTime? FecBaja { get; set; }

	}
}
