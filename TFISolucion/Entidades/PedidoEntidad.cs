using System;

namespace TFI.Entidades
{
	public class PedidoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the PedidoEntidad class.
		/// </summary>
		public PedidoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the PedidoEntidad class.
		/// </summary>
		public PedidoEntidad(DateTime fechaPedido, DateTime? fechaFinPedido, string nombreUsuario, int? plazoEntrega, int idFormaEntrega, string CUIT, string numeroTracking, int direccionEntrega, DateTime? fecBaja)
		{
			this.FechaPedido = fechaPedido;
			this.FechaFinPedido = fechaFinPedido;
			this.NombreUsuario = nombreUsuario;
			this.PlazoEntrega = plazoEntrega;
			this.IdFormaEntrega = idFormaEntrega;
			this.CUIT = CUIT;
			this.NumeroTracking = numeroTracking;
			this.DireccionEntrega = direccionEntrega;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the PedidoEntidad class.
		/// </summary>
		public PedidoEntidad(int idPedido, DateTime fechaPedido, DateTime? fechaFinPedido, string nombreUsuario, int? plazoEntrega, int idFormaEntrega, string CUIT, string numeroTracking, int direccionEntrega, DateTime? fecBaja)
		{
			this.IdPedido = idPedido;
			this.FechaPedido = fechaPedido;
			this.FechaFinPedido = fechaFinPedido;
			this.NombreUsuario = nombreUsuario;
			this.PlazoEntrega = plazoEntrega;
			this.IdFormaEntrega = idFormaEntrega;
			this.CUIT = CUIT;
			this.NumeroTracking = numeroTracking;
			this.DireccionEntrega = direccionEntrega;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdPedido value.
		/// </summary>
		public int IdPedido { get; set; }

		/// <summary>
		/// Gets or sets the FechaPedido value.
		/// </summary>
		public DateTime FechaPedido { get; set; }

		/// <summary>
		/// Gets or sets the FechaFinPedido value.
		/// </summary>
		public DateTime? FechaFinPedido { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

		/// <summary>
		/// Gets or sets the PlazoEntrega value.
		/// </summary>
		public int? PlazoEntrega { get; set; }

		/// <summary>
		/// Gets or sets the IdFormaEntrega value.
		/// </summary>
		public int IdFormaEntrega { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NumeroTracking value.
		/// </summary>
		public string NumeroTracking { get; set; }

		/// <summary>
		/// Gets or sets the DireccionEntrega value.
		/// </summary>
		public int DireccionEntrega { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
