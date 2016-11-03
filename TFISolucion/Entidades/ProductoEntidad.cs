using System;

namespace TFI.Entidades
{
	public class ProductoEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the CodigoProducto value.
		/// </summary>
		public string CodigoProducto { get; set; }

		/// <summary>
		/// Gets or sets the PrecioUnitario value.
		/// </summary>
		public decimal PrecioUnitario { get; set; }

		/// <summary>
		/// Gets or sets the IdMarca value.
		/// </summary>
		public int IdMarca { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the IdIvaProducto value.
		/// </summary>
		public int IdIvaProducto { get; set; }

		/// <summary>
		/// Gets or sets the DescripProducto value.
		/// </summary>
		public string DescripProducto { get; set; }

		/// <summary>
		/// Gets or sets the URL value.
		/// </summary>
		public string URL { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

        public string DescripLarga { get; set; }

		#endregion
	}
}
