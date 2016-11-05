using System;

namespace TFI.Entidades
{
    public class UsuarioEntidad
    {
        #region Properties
        /// <summary>
        /// Gets or sets the IdUsuario value.
        /// </summary>
        public int IdUsuario { get; set; }

        /// <summary>
        /// Gets or sets the IdCondicionFiscal value.
        /// </summary>
        public int? IdCondicionFiscal { get; set; }

        /// <summary>
        /// Gets or sets the IdUsuarioTipo value.
        /// </summary>
        public int IdUsuarioTipo { get; set; }

        /// <summary>
        /// Gets or sets the Nombre value.
        /// </summary>
        public string Nombre { get; set; }

        /// <summary>
        /// Gets or sets the Apellido value.
        /// </summary>
        public string Apellido { get; set; }

        /// <summary>
        /// Gets or sets the Dni value.
        /// </summary>
        public string NroIdentificacion { get; set; }

        /// <summary>
        /// Gets or sets the CUIT value.
        /// </summary>
        public string CUIT { get; set; }

        /// <summary>
        /// Gets or sets the Email value.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Gets or sets the NombreUsuario value.
        /// </summary>
        public string NombreUsuario { get; set; }

        /// <summary>
        /// Gets or sets the Clave value.
        /// </summary>
        public string Clave { get; set; }

        /// <summary>
        /// Gets or sets the FecBaja value.
        /// </summary>
        public DateTime? FecBaja { get; set; }

        public string URI { get; set; }

        #endregion
    }
}
