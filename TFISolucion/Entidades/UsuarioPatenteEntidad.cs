using System;

namespace TFI.Entidades
{
	public class UsuarioPatenteEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the UsuarioPatenteEntidad class.
		/// </summary>
		public UsuarioPatenteEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the UsuarioPatenteEntidad class.
		/// </summary>
		public UsuarioPatenteEntidad(int cUIT, string nombreUsuario, int idPatente, DateTime? fecBaja)
		{
			this.CUIT = cUIT;
			this.NombreUsuario = nombreUsuario;
			this.IdPatente = idPatente;
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
		/// Gets or sets the IdPatente value.
		/// </summary>
		public int IdPatente { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
