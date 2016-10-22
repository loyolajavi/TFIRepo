using System;

namespace TFI.Entidades
{
	public class ListaDeseosDetalleEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ListaDeseosDetalleEntidad class.
		/// </summary>
		public ListaDeseosDetalleEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ListaDeseosDetalleEntidad class.
		/// </summary>
		public ListaDeseosDetalleEntidad(int idListaDeseos, int idProducto, DateTime fechaDeseoDetalle, DateTime? fecBaja)
		{
			this.IdListaDeseos = idListaDeseos;
			this.IdProducto = idProducto;
			this.FechaDeseoDetalle = fechaDeseoDetalle;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the ListaDeseosDetalleEntidad class.
		/// </summary>
		public ListaDeseosDetalleEntidad(int idListaDeseos, int idListaDeseosDetalle, int idProducto, DateTime fechaDeseoDetalle, DateTime? fecBaja)
		{
			this.IdListaDeseos = idListaDeseos;
			this.IdListaDeseosDetalle = idListaDeseosDetalle;
			this.IdProducto = idProducto;
			this.FechaDeseoDetalle = fechaDeseoDetalle;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdListaDeseos value.
		/// </summary>
		public int IdListaDeseos { get; set; }

		/// <summary>
		/// Gets or sets the IdListaDeseosDetalle value.
		/// </summary>
		public int IdListaDeseosDetalle { get; set; }

		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the FechaDeseoDetalle value.
		/// </summary>
		public DateTime FechaDeseoDetalle { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
