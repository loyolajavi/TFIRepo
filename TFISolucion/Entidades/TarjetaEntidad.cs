using System;

namespace TFI.Entidades
{
	public class TarjetaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the TarjetaEntidad class.
		/// </summary>
		public TarjetaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the TarjetaEntidad class.
		/// </summary>
		public TarjetaEntidad(int idTarjeta, int idTipoTarjeta, string CUIT, string nombreUsuario, string titular, DateTime vencimiento, long numero, int codSeguridad, DateTime? fecBaja)
		{
			this.IdTarjeta = idTarjeta;
			this.IdTipoTarjeta = idTipoTarjeta;
			this.CUIT = CUIT;
			this.NombreUsuario = nombreUsuario;
			this.Titular = titular;
			this.Vencimiento = vencimiento;
			this.Numero = numero;
			this.CodSeguridad = codSeguridad;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdTarjeta value.
		/// </summary>
		public int IdTarjeta { get; set; }

		/// <summary>
		/// Gets or sets the IdTipoTarjeta value.
		/// </summary>
		public int IdTipoTarjeta { get; set; }

		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreUsuario value.
		/// </summary>
		public string NombreUsuario { get; set; }

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
		public long Numero { get; set; }

		/// <summary>
		/// Gets or sets the CodSeguridad value.
		/// </summary>
		public int CodSeguridad { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
