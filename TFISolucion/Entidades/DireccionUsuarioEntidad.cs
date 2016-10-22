using System;

namespace TFI.Entidades
{
	public class DireccionUsuarioEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the DireccionUsuarioEntidad class.
		/// </summary>
		public DireccionUsuarioEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the DireccionUsuarioEntidad class.
		/// </summary>
		public DireccionUsuarioEntidad(int idDireccion, int cUIT, string nombreUsuario, DateTime? fecBaja)
		{
			this.IdDireccion = idDireccion;
			this.CUIT = cUIT;
			this.NombreUsuario = nombreUsuario;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdDireccion value.
		/// </summary>
		public int IdDireccion { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public int CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
