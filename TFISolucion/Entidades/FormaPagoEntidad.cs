using System;

namespace TFI.Entidades
{
	public class FormaPagoEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the FormaPagoEntidad class.
		/// </summary>
		public FormaPagoEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the FormaPagoEntidad class.
		/// </summary>
		public FormaPagoEntidad(string descripFormaPago, DateTime? fecBaja)
		{
			this.DescripFormaPago = descripFormaPago;
            this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the FormaPagoEntidad class.
		/// </summary>
		public FormaPagoEntidad(int idFormaPago, string descripFormaPago, DateTime? fecBaja)
		{
			this.IdFormaPago = idFormaPago;
			this.DescripFormaPago = descripFormaPago;
            this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdFormaPago value.
		/// </summary>
		public int IdFormaPago { get; set; }

		/// <summary>
		/// Gets or sets the DescripFormaPago value.
		/// </summary>
		public string DescripFormaPago { get; set; }

        /// <summary>
        /// Gets or sets the FecBaja value.
        /// </summary>
        public DateTime? FecBaja { get; set; }

		#endregion
	}
}
