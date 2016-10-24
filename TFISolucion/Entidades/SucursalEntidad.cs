using System;

namespace TFI.Entidades
{
	public class SucursalEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the SucursalEntidad class.
		/// </summary>
		public SucursalEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the SucursalEntidad class.
		/// </summary>
		public SucursalEntidad(string descripSucursal, int direccionSucursal, string CUIT, DateTime? fecBaja)
		{
			this.DescripSucursal = descripSucursal;
			this.DireccionSucursal = direccionSucursal;
			this.CUIT = CUIT;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the SucursalEntidad class.
		/// </summary>
		public SucursalEntidad(int idSucursal, string descripSucursal, int direccionSucursal, string CUIT, DateTime? fecBaja)
		{
			this.IdSucursal = idSucursal;
			this.DescripSucursal = descripSucursal;
			this.DireccionSucursal = direccionSucursal;
			this.CUIT = CUIT;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdSucursal value.
		/// </summary>
		public int IdSucursal { get; set; }

		/// <summary>
		/// Gets or sets the DescripSucursal value.
		/// </summary>
		public string DescripSucursal { get; set; }

		/// <summary>
		/// Gets or sets the DireccionSucursal value.
		/// </summary>
		public int DireccionSucursal { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
