using System;

namespace TFI.Entidades
{
	public class EstadoPedidoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the EstadoPedidoEntidad class.
		/// </summary>
		public EstadoPedidoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the EstadoPedidoEntidad class.
		/// </summary>
		public EstadoPedidoEntidad(string descripcionEstadoPedido, DateTime? fecBaja)
		{
			this.DescripcionEstadoPedido = descripcionEstadoPedido;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the EstadoPedidoEntidad class.
		/// </summary>
		public EstadoPedidoEntidad(int idEstadoPedido, string descripcionEstadoPedido, DateTime? fecBaja)
		{
			this.IdEstadoPedido = idEstadoPedido;
			this.DescripcionEstadoPedido = descripcionEstadoPedido;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdEstadoPedido value.
		/// </summary>
		public int IdEstadoPedido { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionEstadoPedido value.
		/// </summary>
		public string DescripcionEstadoPedido { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
