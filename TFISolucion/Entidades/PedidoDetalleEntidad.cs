using System;

namespace TFI.Entidades
{
	public class PedidoDetalleEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the PedidoDetalleEntidad class.
		/// </summary>
		public PedidoDetalleEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the PedidoDetalleEntidad class.
		/// </summary>
		public PedidoDetalleEntidad(int idPedidoDetalle, int idPedido, int cantidad, decimal precioUnitario, int? descuento, int idProducto, DateTime? fecBaja)
		{
			this.IdPedidoDetalle = idPedidoDetalle;
			this.IdPedido = idPedido;
			this.Cantidad = cantidad;
			this.PrecioUnitario = precioUnitario;
			this.Descuento = descuento;
			this.IdProducto = idProducto;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdPedidoDetalle value.
		/// </summary>
		public int IdPedidoDetalle { get; set; }

		/// <summary>
		/// Gets or sets the IdPedido value.
		/// </summary>
		public int IdPedido { get; set; }

		/// <summary>
		/// Gets or sets the Cantidad value.
		/// </summary>
		public int Cantidad { get; set; }

		/// <summary>
		/// Gets or sets the PrecioUnitario value.
		/// </summary>
		public decimal PrecioUnitario { get; set; }

		/// <summary>
		/// Gets or sets the Descuento value.
		/// </summary>
		public int? Descuento { get; set; }

		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
