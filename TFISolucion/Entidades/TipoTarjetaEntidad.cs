using System;

namespace TFI.Entidades
{
	public class TipoTarjetaEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdTipoTarjeta value.
		/// </summary>
		public int IdTipoTarjeta { get; set; }

		/// <summary>
		/// Gets or sets the Descripcion value.
		/// </summary>
		public string Descripcion { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
