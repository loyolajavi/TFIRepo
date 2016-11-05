using System;

namespace TFI.Entidades
{
	public class ProdCategoriaEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the IdCategoria value.
		/// </summary>
		public int IdCategoria { get; set; }

        public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
