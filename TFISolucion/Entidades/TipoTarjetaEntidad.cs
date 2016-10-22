using System;

namespace TFI.Entidades
{
	public class TipoTarjetaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the TipoTarjetaEntidad class.
		/// </summary>
		public TipoTarjetaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the TipoTarjetaEntidad class.
		/// </summary>
		public TipoTarjetaEntidad(int idTipoTarjeta, string descripcion, DateTime? fecBaja)
		{
			this.IdTipoTarjeta = idTipoTarjeta;
			this.Descripcion = descripcion;
			this.FecBaja = fecBaja;
		}

		#endregion

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
