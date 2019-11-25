using System;

namespace TFI.Entidades
{
	public class BitacoraLogEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdBitacoraLog value.
		/// </summary>
		public int IdBitacoraLog { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

		/// <summary>
		/// Gets or sets the Evento value.
		/// </summary>
		public string TipoLog { get; set; }

        public string Accion { get; set; }
        public string Mensaje{ get; set; }

		/// <summary>
		/// Gets or sets the FechaEvento value.
		/// </summary>
		public DateTime Fecha { get; set; }

		#endregion
	}
}
