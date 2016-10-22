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
		public ListaDeseoEntidad(int cUIT, string nombreUsuario, DateTime? fecBaja)
		{
			this.CUIT = cUIT;
			this.NombreUsuario = nombreUsuario;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the ListaDeseoEntidad class.
		/// </summary>
		public ListaDeseoEntidad(int idListaDeseos, int cUIT, string nombreUsuario, DateTime? fecBaja)
		{
			this.IdListaDeseos = idListaDeseos;
			this.CUIT = cUIT;
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
