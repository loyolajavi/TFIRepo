using System;

namespace TFI.Entidades
{
	public class BitacoraLogEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the BitacoraLogEntidad class.
		/// </summary>
		public BitacoraLogEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the BitacoraLogEntidad class.
		/// </summary>
		public BitacoraLogEntidad(int idBitacoraLog, int cUIT, string nombreUsuario, string evento, DateTime fechaEvento)
		{
			this.IdBitacoraLog = idBitacoraLog;
			this.CUIT = cUIT;
			this.NombreUsuario = nombreUsuario;
			this.Evento = evento;
			this.FechaEvento = fechaEvento;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdBitacoraLog value.
		/// </summary>
		public int IdBitacoraLog { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public int CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

		/// <summary>
		/// Gets or sets the Evento value.
		/// </summary>
		public string Evento { get; set; }

		/// <summary>
		/// Gets or sets the FechaEvento value.
		/// </summary>
		public DateTime FechaEvento { get; set; }

		#endregion
	}
}
