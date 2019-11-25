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
	}
}
