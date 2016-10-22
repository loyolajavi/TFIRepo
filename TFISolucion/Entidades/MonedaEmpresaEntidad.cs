using System;

namespace TFI.Entidades
{
	public class MonedaEmpresaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the MonedaEmpresaEntidad class.
		/// </summary>
		public MonedaEmpresaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the MonedaEmpresaEntidad class.
		/// </summary>
		public MonedaEmpresaEntidad(int idMoneda, int CUIT, DateTime? fecBaja)
		{
			this.IdMoneda = idMoneda;
			this.CUIT = CUIT;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdMoneda value.
		/// </summary>
		public int IdMoneda { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public int CUIT { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
