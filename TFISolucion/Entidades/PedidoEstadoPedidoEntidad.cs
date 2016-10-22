using System;

namespace TFI.Entidades
{
	public class PedidoEstadoPedidoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the PedidoEstadoPedidoEntidad class.
		/// </summary>
		public PedidoEstadoPedidoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the PedidoEstadoPedidoEntidad class.
		/// </summary>
		public PedidoEstadoPedidoEntidad(int idPedido, int idEstadoPedido, DateTime fecha, DateTime? fecBaja)
		{
			this.IdPedido = idPedido;
			this.IdEstadoPedido = idEstadoPedido;
			this.Fecha = fecha;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdPedido value.
		/// </summary>
		public int IdPedido { get; set; }

		/// <summary>
		/// Gets or sets the IdEstadoPedido value.
		/// </summary>
		public int IdEstadoPedido { get; set; }

		/// <summary>
		/// Gets or sets the Fecha value.
		/// </summary>
		public DateTime Fecha { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
