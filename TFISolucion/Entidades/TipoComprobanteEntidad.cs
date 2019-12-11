using System;

namespace TFI.Entidades
{
	public class TipoComprobanteEntidad
	{
		
		#region Properties
		/// <summary>
		/// Gets or sets the IdTipoComprobante value.
		/// </summary>
		public int IdTipoComprobante { get; set; }

		/// <summary>
		/// Gets or sets the DescripTipoComprobante value.
		/// </summary>
		public string DescripTipoComprobante { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion

        public enum Options
        {
            FacturaA = 1, 
            FacturaB = 2,
            FacturaC = 3,
            FacturaM = 4,
            NotaCreditoA = 5,
            NotaCreditoB = 6,
            NotaCreditoC = 7,
            NotaDebitoA = 8,
            NotaDebitoB = 9,
            NotaDebitoC = 10
            
        }


	}
}
