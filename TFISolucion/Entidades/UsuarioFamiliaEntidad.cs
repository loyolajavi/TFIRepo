using System;

namespace TFI.Entidades
{
	public class UsuarioFamiliaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the UsuarioFamiliaEntidad class.
		/// </summary>
		public UsuarioFamiliaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the UsuarioFamiliaEntidad class.
		/// </summary>
		public UsuarioFamiliaEntidad(int cUIT, string nombreUsuario, int idFamilia, DateTime? fecBaja)
		{
			this.CUIT = cUIT;
			this.NombreUsuario = nombreUsuario;
			this.IdFamilia = idFamilia;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public int CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

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
