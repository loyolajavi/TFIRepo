using System;

namespace TFI.Entidades
{
    public class MonedaEntidad
    {


        #region Properties
        /// <summary>
        /// Gets or sets the IdMoneda value.
        /// </summary>
        public int IdMoneda { get; set; }

        /// <summary>
        /// Gets or sets the Nombre value.
        /// </summary>
        public string Nombre { get; set; }

        /// <summary>
        /// Gets or sets the Cotizacion value.
        /// </summary>

        public string SimboloMoneda { get; set; }
        /// <summary>
        /// Gets or sets the FecBaja value.
        /// </summary>
        public DateTime? FecBaja { get; set; }

        public String Url { get; set; }

        #endregion
    }
}
