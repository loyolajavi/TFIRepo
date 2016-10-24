using System;

namespace TFI.Entidades
{
	public class ComprobanteDetalleEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ComprobanteDetalleEntidad class.
		/// </summary>
		public ComprobanteDetalleEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ComprobanteDetalleEntidad class.
		/// </summary>
		public ComprobanteDetalleEntidad(int idComprobanteDetalle, int nroComprobante, int idSucursal, int idTipoComprobante, string CUIT, int idProducto, int cantidadProducto, decimal precioUnitarioFact, DateTime? fecBaja)
		{
			this.IdComprobanteDetalle = idComprobanteDetalle;
			this.NroComprobante = nroComprobante;
			this.IdSucursal = idSucursal;
			this.IdTipoComprobante = idTipoComprobante;
			this.CUIT = CUIT;
			this.IdProducto = idProducto;
			this.CantidadProducto = cantidadProducto;
			this.PrecioUnitarioFact = precioUnitarioFact;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdComprobanteDetalle value.
		/// </summary>
		public int IdComprobanteDetalle { get; set; }

		/// <summary>
		/// Gets or sets the NroComprobante value.
		/// </summary>
		public int NroComprobante { get; set; }

		/// <summary>
		/// Gets or sets the IdSucursal value.
		/// </summary>
		public int IdSucursal { get; set; }

		/// <summary>
		/// Gets or sets the IdTipoComprobante value.
		/// </summary>
		public int IdTipoComprobante { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the CantidadProducto value.
		/// </summary>
		public int CantidadProducto { get; set; }

		/// <summary>
		/// Gets or sets the PrecioUnitarioFact value.
		/// </summary>
		public decimal PrecioUnitarioFact { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
