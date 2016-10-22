using System;

namespace TFI.Entidades
{
	public class TipoComprobanteEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the TipoComprobanteEntidad class.
		/// </summary>
		public TipoComprobanteEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the TipoComprobanteEntidad class.
		/// </summary>
		public TipoComprobanteEntidad(string descripTipoComprobante, DateTime? fecBaja)
		{
			this.DescripTipoComprobante = descripTipoComprobante;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the TipoComprobanteEntidad class.
		/// </summary>
		public TipoComprobanteEntidad(int idTipoComprobante, string descripTipoComprobante, DateTime? fecBaja)
		{
			this.IdTipoComprobante = idTipoComprobante;
			this.DescripTipoComprobante = descripTipoComprobante;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdTipoComprobante value.
		/// </summary>
		public int IdTipoComprobante { get; set; }

		/// <summary>
		/// Gets or sets the DescripTipoComprobante value.
		/// </summary>
		public string DescripTipoComprobante { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
