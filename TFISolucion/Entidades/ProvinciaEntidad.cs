using System;

namespace TFI.Entidades
{
	public class ProvinciaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ProvinciaEntidad class.
		/// </summary>
		public ProvinciaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ProvinciaEntidad class.
		/// </summary>
		public ProvinciaEntidad(int idProvincia, string descripcionProvincia, DateTime? fecBaja)
		{
			this.IdProvincia = idProvincia;
			this.DescripcionProvincia = descripcionProvincia;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdProvincia value.
		/// </summary>
		public int IdProvincia { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionProvincia value.
		/// </summary>
		public string DescripcionProvincia { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
