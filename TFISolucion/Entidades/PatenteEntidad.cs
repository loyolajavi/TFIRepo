using System;

namespace TFI.Entidades
{
	public class PatenteEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the PatenteEntidad class.
		/// </summary>
		public PatenteEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the PatenteEntidad class.
		/// </summary>
		public PatenteEntidad(string nombrePatente, DateTime? fecBaja)
		{
			this.NombrePatente = nombrePatente;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the PatenteEntidad class.
		/// </summary>
		public PatenteEntidad(int idPatente, string nombrePatente, DateTime? fecBaja)
		{
			this.IdPatente = idPatente;
			this.NombrePatente = nombrePatente;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdPatente value.
		/// </summary>
		public int IdPatente { get; set; }

		/// <summary>
		/// Gets or sets the NombrePatente value.
		/// </summary>
		public string NombrePatente { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
