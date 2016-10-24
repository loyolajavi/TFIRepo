using System;

namespace TFI.Entidades
{
	public class ComprobanteEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ComprobanteEntidad class.
		/// </summary>
		public ComprobanteEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ComprobanteEntidad class.
		/// </summary>
		public ComprobanteEntidad(int nroComprobante, int idSucursal, string CUIT, int idTipoComprobante, int idComprobante, DateTime fechaComprobante, int idPedido, DateTime? fecBaja)
		{
			this.NroComprobante = nroComprobante;
			this.IdSucursal = idSucursal;
			this.CUIT = CUIT;
			this.IdTipoComprobante = idTipoComprobante;
			this.IdComprobante = idComprobante;
			this.FechaComprobante = fechaComprobante;
			this.IdPedido = idPedido;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the NroComprobante value.
		/// </summary>
		public int NroComprobante { get; set; }

		/// <summary>
		/// Gets or sets the IdSucursal value.
		/// </summary>
		public int IdSucursal { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the IdTipoComprobante value.
		/// </summary>
		public int IdTipoComprobante { get; set; }

		/// <summary>
		/// Gets or sets the IdComprobante value.
		/// </summary>
		public int IdComprobante { get; set; }

		/// <summary>
		/// Gets or sets the FechaComprobante value.
		/// </summary>
		public DateTime FechaComprobante { get; set; }

		/// <summary>
		/// Gets or sets the IdPedido value.
		/// </summary>
		public int IdPedido { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
