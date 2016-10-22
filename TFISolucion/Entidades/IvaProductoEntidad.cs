using System;

namespace TFI.Entidades
{
	public class IvaProductoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the IvaProductoEntidad class.
		/// </summary>
		public IvaProductoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the IvaProductoEntidad class.
		/// </summary>
		public IvaProductoEntidad(int porcentajeIvaProd, DateTime? fecBaja)
		{
			this.PorcentajeIvaProd = porcentajeIvaProd;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the IvaProductoEntidad class.
		/// </summary>
		public IvaProductoEntidad(int idIvaProducto, int porcentajeIvaProd, DateTime? fecBaja)
		{
			this.IdIvaProducto = idIvaProducto;
			this.PorcentajeIvaProd = porcentajeIvaProd;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdIvaProducto value.
		/// </summary>
		public int IdIvaProducto { get; set; }

		/// <summary>
		/// Gets or sets the PorcentajeIvaProd value.
		/// </summary>
		public int PorcentajeIvaProd { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
