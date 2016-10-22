using System;

namespace TFI.Entidades
{
	public class ReservaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ReservaEntidad class.
		/// </summary>
		public ReservaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ReservaEntidad class.
		/// </summary>
		public ReservaEntidad(int idPedido, int idPedidoDetalle, int idSucursal, bool activo, DateTime fecha, DateTime? fecBaja)
		{
			this.IdPedido = idPedido;
			this.IdPedidoDetalle = idPedidoDetalle;
			this.IdSucursal = idSucursal;
			this.Activo = activo;
			this.Fecha = fecha;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the ReservaEntidad class.
		/// </summary>
		public ReservaEntidad(int idReserva, int idPedido, int idPedidoDetalle, int idSucursal, bool activo, DateTime fecha, DateTime? fecBaja)
		{
			this.IdReserva = idReserva;
			this.IdPedido = idPedido;
			this.IdPedidoDetalle = idPedidoDetalle;
			this.IdSucursal = idSucursal;
			this.Activo = activo;
			this.Fecha = fecha;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdReserva value.
		/// </summary>
		public int IdReserva { get; set; }

		/// <summary>
		/// Gets or sets the IdPedido value.
		/// </summary>
		public int IdPedido { get; set; }

		/// <summary>
		/// Gets or sets the IdPedidoDetalle value.
		/// </summary>
		public int IdPedidoDetalle { get; set; }

		/// <summary>
		/// Gets or sets the IdSucursal value.
		/// </summary>
		public int IdSucursal { get; set; }

		/// <summary>
		/// Gets or sets the Activo value.
		/// </summary>
		public bool Activo { get; set; }

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
