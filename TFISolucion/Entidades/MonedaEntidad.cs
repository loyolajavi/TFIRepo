using System;

namespace TFI.Entidades
{
	public class MonedaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the MonedaEntidad class.
		/// </summary>
		public MonedaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the MonedaEntidad class.
		/// </summary>
		public MonedaEntidad(string nombre, decimal cotizacion, DateTime? fecBaja)
		{
			this.Nombre = nombre;
			this.Cotizacion = cotizacion;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the MonedaEntidad class.
		/// </summary>
		public MonedaEntidad(int idMoneda, string nombre, decimal cotizacion, DateTime? fecBaja)
		{
			this.IdMoneda = idMoneda;
			this.Nombre = nombre;
			this.Cotizacion = cotizacion;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdMoneda value.
		/// </summary>
		public int IdMoneda { get; set; }

		/// <summary>
		/// Gets or sets the Nombre value.
		/// </summary>
		public string Nombre { get; set; }

		/// <summary>
		/// Gets or sets the Cotizacion value.
		/// </summary>
		public decimal Cotizacion { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
