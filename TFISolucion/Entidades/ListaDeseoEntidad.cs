using System;

namespace TFI.Entidades
{
	public class ListaDeseoEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

        /// <summary>
        /// Gets or sets the identifier producto.
        /// </summary>
        public int IdProducto { get; set; }
        
        
        /// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
