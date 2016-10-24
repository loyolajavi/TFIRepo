using System;

namespace TFI.Entidades
{
	public class ListaDeseoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ListaDeseoEntidad class.
		/// </summary>
		public ListaDeseoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ListaDeseoEntidad class.
		/// </summary>
		public ListaDeseoEntidad(string CUIT, string nombreUsuario, DateTime? fecBaja)
		{
			this.CUIT = CUIT;
			this.NombreUsuario = nombreUsuario;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the ListaDeseoEntidad class.
		/// </summary>
		public ListaDeseoEntidad(int idListaDeseos, string CUIT, string nombreUsuario, DateTime? fecBaja)
		{
			this.IdListaDeseos = idListaDeseos;
			this.CUIT = CUIT;
			this.NombreUsuario = nombreUsuario;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdListaDeseos value.
		/// </summary>
		public int IdListaDeseos { get; set; }

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
