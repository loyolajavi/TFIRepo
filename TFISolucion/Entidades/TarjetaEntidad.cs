using System;

namespace TFI.Entidades
{
	public class TarjetaEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdTarjeta value.
		/// </summary>
		public int IdTarjeta { get; set; }

		/// <summary>
		/// Gets or sets the IdTipoTarjeta value.
		/// </summary>
        public TipoTarjetaEntidad miTipoTarjeta { get; set; }

        public UsuarioEntidad miUsuario { get; set; }

		/// <summary>
		/// Gets or sets the Titular value.
		/// </summary>
		public string Titular { get; set; }

		/// <summary>
		/// Gets or sets the Vencimiento value.
		/// </summary>
		public DateTime Vencimiento { get; set; }

		/// <summary>
		/// Gets or sets the Numero value.
		/// </summary>
		public Int64 Numero { get; set; }

		/// <summary>
		/// Gets or sets the CodSeguridad value.
		/// </summary>
		public int CodSeguridad { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

        public bool Predeterminada { get; set; }

		#endregion
	}
}
