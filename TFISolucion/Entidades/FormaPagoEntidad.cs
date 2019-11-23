using System;

namespace TFI.Entidades
{
	public class FormaPagoEntidad
	{
		public int IdFormaPago { get; set; }
		public string DescripFormaPago { get; set; }
        public DateTime? FecBaja { get; set; }

        public enum Options
        {
            ECommerce = 1,
            Externa = 2
        }
	}
}
