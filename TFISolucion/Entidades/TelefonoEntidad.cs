using System;

namespace TFI.Entidades
{
	public class TelefonoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the TelefonoEntidad class.
		/// </summary>
		public TelefonoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the TelefonoEntidad class.
		/// </summary>
		public TelefonoEntidad(int cUIT, string nombreUsuario, string nroTelefono, string codArea, int idTipoTel, DateTime? fecBaja)
		{
			this.CUIT = cUIT;
			this.NombreUsuario = nombreUsuario;
			this.NroTelefono = nroTelefono;
			this.CodArea = codArea;
			this.IdTipoTel = idTipoTel;
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
		/// Gets or sets the NroTelefono value.
		/// </summary>
		public string NroTelefono { get; set; }

		/// <summary>
		/// Gets or sets the CodArea value.
		/// </summary>
		public string CodArea { get; set; }

		/// <summary>
		/// Gets or sets the IdTipoTel value.
		/// </summary>
		public int IdTipoTel { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
