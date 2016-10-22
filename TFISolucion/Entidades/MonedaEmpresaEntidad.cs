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
		public MonedaEmpresaEntidad(int idMoneda, int cuit, DateTime? fecBaja)
		{
			this.IdMoneda = idMoneda;
			this.cuit = cuit;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdMoneda value.
		/// </summary>
		public int IdMoneda { get; set; }

		/// <summary>
		/// Gets or sets the cuit value.
		/// </summary>
		public int cuit { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
