using System;

namespace TFI.Entidades
{
	public class ProductoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ProductoEntidad class.
		/// </summary>
		public ProductoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ProductoEntidad class.
		/// </summary>
		public ProductoEntidad(string codigoProducto, decimal precioUnitario, int idMarca, string CUIT, int idIvaProducto, string descripProducto, string uRL, DateTime? fecBaja, string descripLarga)
		{
			this.CodigoProducto = codigoProducto;
			this.PrecioUnitario = precioUnitario;
			this.IdMarca = idMarca;
			this.CUIT = CUIT;
			this.IdIvaProducto = idIvaProducto;
			this.DescripProducto = descripProducto;
			this.URL = uRL;
			this.FecBaja = fecBaja;
            this.DescripLarga = descripLarga;
		}

		/// <summary>
		/// Initializes a new instance of the ProductoEntidad class.
		/// </summary>
        public ProductoEntidad(int idProducto, string codigoProducto, decimal precioUnitario, int idMarca, string CUIT, int idIvaProducto, string descripProducto, string uRL, DateTime? fecBaja, string descripLarga)
		{
			this.IdProducto = idProducto;
			this.CodigoProducto = codigoProducto;
			this.PrecioUnitario = precioUnitario;
			this.IdMarca = idMarca;
			this.CUIT = CUIT;
			this.IdIvaProducto = idIvaProducto;
			this.DescripProducto = descripProducto;
			this.URL = uRL;
			this.FecBaja = fecBaja;
            this.DescripLarga = descripLarga;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the CodigoProducto value.
		/// </summary>
		public string CodigoProducto { get; set; }

		/// <summary>
		/// Gets or sets the PrecioUnitario value.
		/// </summary>
		public decimal PrecioUnitario { get; set; }

		/// <summary>
		/// Gets or sets the IdMarca value.
		/// </summary>
		public int IdMarca { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the IdIvaProducto value.
		/// </summary>
		public int IdIvaProducto { get; set; }

		/// <summary>
		/// Gets or sets the DescripProducto value.
		/// </summary>
		public string DescripProducto { get; set; }

		/// <summary>
		/// Gets or sets the URL value.
		/// </summary>
		public string URL { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

        public string DescripLarga { get; set; }

		#endregion
	}
}
