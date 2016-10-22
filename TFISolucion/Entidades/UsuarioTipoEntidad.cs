using System;

namespace TFI.Entidades
{
	public class UsuarioTipoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the UsuarioTipoEntidad class.
		/// </summary>
		public UsuarioTipoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the UsuarioTipoEntidad class.
		/// </summary>
		public UsuarioTipoEntidad(string descripcion, DateTime? fecBaja)
		{
			this.Descripcion = descripcion;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the UsuarioTipoEntidad class.
		/// </summary>
		public UsuarioTipoEntidad(int idUsuarioTipo, string descripcion, DateTime? fecBaja)
		{
			this.IdUsuarioTipo = idUsuarioTipo;
			this.Descripcion = descripcion;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdUsuarioTipo value.
		/// </summary>
		public int IdUsuarioTipo { get; set; }

		/// <summary>
		/// Gets or sets the Descripcion value.
		/// </summary>
		public string Descripcion { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
