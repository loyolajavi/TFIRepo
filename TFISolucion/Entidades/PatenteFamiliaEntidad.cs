using System;

namespace TFI.Entidades
{
	public class PatenteFamiliaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the PatenteFamiliaEntidad class.
		/// </summary>
		public PatenteFamiliaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the PatenteFamiliaEntidad class.
		/// </summary>
		public PatenteFamiliaEntidad(int idPatente, int idFamilia, DateTime? fecBaja)
		{
			this.IdPatente = idPatente;
			this.IdFamilia = idFamilia;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdPatente value.
		/// </summary>
		public int IdPatente { get; set; }

		/// <summary>
		/// Gets or sets the IdFamilia value.
		/// </summary>
		public int IdFamilia { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
