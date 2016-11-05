using System;

namespace TFI.Entidades
{
	public class IvaProductoEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdIvaProducto value.
		/// </summary>
		public int IdIvaProducto { get; set; }

		/// <summary>
		/// Gets or sets the PorcentajeIvaProd value.
		/// </summary>
		public decimal PorcentajeIvaProd { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
