using System;

namespace TFI.Entidades
{
	public class PagoEstadoPagoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the PagoEstadoPagoEntidad class.
		/// </summary>
		public PagoEstadoPagoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the PagoEstadoPagoEntidad class.
		/// </summary>
		public PagoEstadoPagoEntidad(int idEstadoPago, int idPago, DateTime fecha, DateTime? fecBaja)
		{
			this.IdEstadoPago = idEstadoPago;
			this.IdPago = idPago;
			this.Fecha = fecha;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdEstadoPago value.
		/// </summary>
		public int IdEstadoPago { get; set; }

		/// <summary>
		/// Gets or sets the IdPago value.
		/// </summary>
		public int IdPago { get; set; }

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
