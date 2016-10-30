using System;

namespace TFI.Entidades
{
	public class UsuarioEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the UsuarioEntidad class.
		/// </summary>
		public UsuarioEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the UsuarioEntidad class.
		/// </summary>
        public UsuarioEntidad(int? idCondicionFiscal, int idUsuarioTipo, string nombre, string apellido, string nroIdentificacion, string CUIT, string email, string nombreUsuario, string clave, DateTime? fecBaja)
		{
			this.IdCondicionFiscal = idCondicionFiscal;
			this.IdUsuarioTipo = idUsuarioTipo;
			this.Nombre = nombre;
			this.Apellido = apellido;
            this.NroIdentificacion = nroIdentificacion;
			this.CUIT = CUIT;
			this.Email = email;
			this.NombreUsuario = nombreUsuario;
			this.Clave = clave;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the UsuarioEntidad class.
		/// </summary>
		public UsuarioEntidad(int idUsuario, int? idCondicionFiscal, int idUsuarioTipo, string nombre, string apellido, string nroIdentificacion, string CUIT, string email, string nombreUsuario, string clave, DateTime? fecBaja)
		{
			this.IdUsuario = idUsuario;
			this.IdCondicionFiscal = idCondicionFiscal;
			this.IdUsuarioTipo = idUsuarioTipo;
			this.Nombre = nombre;
			this.Apellido = apellido;
			this.NroIdentificacion = nroIdentificacion;
			this.CUIT = CUIT;
			this.Email = email;
			this.NombreUsuario = nombreUsuario;
			this.Clave = clave;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdUsuario value.
		/// </summary>
		public int IdUsuario { get; set; }

		/// <summary>
		/// Gets or sets the IdCondicionFiscal value.
		/// </summary>
		public int? IdCondicionFiscal { get; set; }

		/// <summary>
		/// Gets or sets the IdUsuarioTipo value.
		/// </summary>
		public int IdUsuarioTipo { get; set; }

		/// <summary>
		/// Gets or sets the Nombre value.
		/// </summary>
		public string Nombre { get; set; }

		/// <summary>
		/// Gets or sets the Apellido value.
		/// </summary>
		public string Apellido { get; set; }

		/// <summary>
		/// Gets or sets the Dni value.
		/// </summary>
        public string NroIdentificacion { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the Email value.
		/// </summary>
		public string Email { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

		/// <summary>
		/// Gets or sets the Clave value.
		/// </summary>
		public string Clave { get; set; }

	    /// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
