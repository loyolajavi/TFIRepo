using System;

namespace TFI.Entidades
{
	public class CategoriaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the CategoriaEntidad class.
		/// </summary>
		public CategoriaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the CategoriaEntidad class.
		/// </summary>
		public CategoriaEntidad(string descripCategoria, DateTime? fecBaja)
		{
			this.DescripCategoria = descripCategoria;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the CategoriaEntidad class.
		/// </summary>
		public CategoriaEntidad(int idCategoria, string descripCategoria, DateTime? fecBaja)
		{
			this.IdCategoria = idCategoria;
			this.DescripCategoria = descripCategoria;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdCategoria value.
		/// </summary>
		public int IdCategoria { get; set; }

		/// <summary>
		/// Gets or sets the DescripCategoria value.
		/// </summary>
		public string DescripCategoria { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
