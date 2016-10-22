using System;

namespace TFI.Entidades
{
	public class TipoTelEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the TipoTelEntidad class.
		/// </summary>
		public TipoTelEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the TipoTelEntidad class.
		/// </summary>
		public TipoTelEntidad(string descripcionTipoTel, DateTime? fecBaja)
		{
			this.DescripcionTipoTel = descripcionTipoTel;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the TipoTelEntidad class.
		/// </summary>
		public TipoTelEntidad(int idTipoTel, string descripcionTipoTel, DateTime? fecBaja)
		{
			this.IdTipoTel = idTipoTel;
			this.DescripcionTipoTel = descripcionTipoTel;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdTipoTel value.
		/// </summary>
		public int IdTipoTel { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionTipoTel value.
		/// </summary>
		public string DescripcionTipoTel { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
