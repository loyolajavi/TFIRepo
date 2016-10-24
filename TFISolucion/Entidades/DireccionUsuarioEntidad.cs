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
		public DireccionUsuarioEntidad(int idDireccion, string CUIT, string nombreUsuario, DateTime? fecBaja)
		{
			this.IdDireccion = idDireccion;
			this.CUIT = CUIT;
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
		public string CUIT { get; set; }

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
