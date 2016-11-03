using System;

namespace TFI.Entidades
{
	public class PedidoEntidad
	{

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

        public Int64 NroPedido { get; set; }

		#endregion
	}
}
