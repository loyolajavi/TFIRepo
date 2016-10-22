using System;

namespace TFI.Entidades
{
	public class FamiliaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the FamiliaEntidad class.
		/// </summary>
		public FamiliaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the FamiliaEntidad class.
		/// </summary>
		public FamiliaEntidad(string nombreFamilia, DateTime? fecBaja)
		{
			this.NombreFamilia = nombreFamilia;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the FamiliaEntidad class.
		/// </summary>
		public FamiliaEntidad(int idFamilia, string nombreFamilia, DateTime? fecBaja)
		{
			this.IdFamilia = idFamilia;
			this.NombreFamilia = nombreFamilia;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdFamilia value.
		/// </summary>
		public int IdFamilia { get; set; }

		/// <summary>
		/// Gets or sets the NombreFamilia value.
		/// </summary>
		public string NombreFamilia { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
