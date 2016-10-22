using System;

namespace TFI.Entidades
{
	public class MarcaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the MarcaEntidad class.
		/// </summary>
		public MarcaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the MarcaEntidad class.
		/// </summary>
		public MarcaEntidad(string descripcionMarca, DateTime? fecBaja)
		{
			this.DescripcionMarca = descripcionMarca;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the MarcaEntidad class.
		/// </summary>
		public MarcaEntidad(int idMarca, string descripcionMarca, DateTime? fecBaja)
		{
			this.IdMarca = idMarca;
			this.DescripcionMarca = descripcionMarca;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdMarca value.
		/// </summary>
		public int IdMarca { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionMarca value.
		/// </summary>
		public string DescripcionMarca { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
