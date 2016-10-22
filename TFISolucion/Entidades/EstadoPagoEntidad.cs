using System;

namespace TFI.Entidades
{
	public class EstadoPagoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the EstadoPagoEntidad class.
		/// </summary>
		public EstadoPagoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the EstadoPagoEntidad class.
		/// </summary>
		public EstadoPagoEntidad(string descripEstadoPago, DateTime? fecBaja)
		{
			this.DescripEstadoPago = descripEstadoPago;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the EstadoPagoEntidad class.
		/// </summary>
		public EstadoPagoEntidad(int idEstadoPago, string descripEstadoPago, DateTime? fecBaja)
		{
			this.IdEstadoPago = idEstadoPago;
			this.DescripEstadoPago = descripEstadoPago;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdEstadoPago value.
		/// </summary>
		public int IdEstadoPago { get; set; }

		/// <summary>
		/// Gets or sets the DescripEstadoPago value.
		/// </summary>
		public string DescripEstadoPago { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
