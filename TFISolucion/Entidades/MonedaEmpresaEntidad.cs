using System;

namespace TFI.Entidades
{
    public class MonedaEmpresaEntidad
    {
        #region Properties
        /// <summary>
        /// Gets or sets the IdMoneda value.
        /// </summary>
        public int IdMoneda { get; set; }

        /// <summary>
        /// Gets or sets the CUIT value.
        /// </summary>
        public string CUIT { get; set; }

        public decimal Cotizacion { get; set; }

        public DateTime Fecha { get; set; }

        /// <summary>
        /// Gets or sets the FecBaja value.
        /// </summary>
        public DateTime? FecBaja { get; set; }

        #endregion
    }
}
