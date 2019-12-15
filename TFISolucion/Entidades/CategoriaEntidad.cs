using System;
using System.Collections.Generic;

namespace TFI.Entidades
{
	public class CategoriaEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdCategoria value.
		/// </summary>
		public int IdCategoria { get; set; }

		/// <summary>
		/// Gets or sets the DescripCategoria value.
		/// </summary>
		public string DescripCategoria { get; set; }

        public string CUIT { get; set; }

        public List<ProductoEntidad> misProductos { get; set; }

		#endregion
	}
}
