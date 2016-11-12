using System;

namespace TFI.Entidades
{
	public class StockSucursalEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the IdSucursal value.
		/// </summary>
		public int IdSucursal { get; set; }

		/// <summary>
		/// Gets or sets the CantidadProducto value.
		/// </summary>
		public int CantidadProducto { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

        public string CUIT { get; set; }

		#endregion
	}
}
