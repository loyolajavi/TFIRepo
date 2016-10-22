using System;

namespace TFI.Entidades
{
	public class ProdCategoriaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ProdCategoriaEntidad class.
		/// </summary>
		public ProdCategoriaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ProdCategoriaEntidad class.
		/// </summary>
		public ProdCategoriaEntidad(int idProducto, int idCategoria, DateTime? fecBaja)
		{
			this.IdProducto = idProducto;
			this.IdCategoria = idCategoria;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the IdCategoria value.
		/// </summary>
		public int IdCategoria { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
