using System;

namespace TFI.Entidades
{
    public class DireccionUsuarioEntidad
    {
        #region Properties

        /// <summary>
        /// Gets or sets the IdDireccion value.
        /// </summary>
        public int IdDireccion { get; set; }

        /// <summary>
        /// Gets or sets the CUIT value.
        /// </summary>
        public string CUIT { get; set; }

        /// <summary>
        /// Gets or sets the NombreUsuario value.
        /// </summary>
        public string NombreUsuario { get; set; }

        /// <summary>
        /// Gets or sets the FecBaja value.
        /// </summary>
        public DateTime? FecBaja { get; set; }

        public bool Predeterminada { get; set; }

        #endregion Properties
    }
}