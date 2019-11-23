using System;

namespace TFI.Entidades
{
	public class PagoEntidad
	{

		public int IdPago { get; set; }
		public int IdPedido { get; set; }
		public DateTime FechaPago { get; set; }
        public FormaPagoEntidad miFormaPago { get; set; }
		public decimal MontoPago { get; set; }
		public string CUIT { get; set; }
		public DateTime? FecBaja { get; set; }
	}
}
