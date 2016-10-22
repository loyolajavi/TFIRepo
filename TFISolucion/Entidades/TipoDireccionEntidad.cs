using System;

namespace TFI.Entidades
{
	public class TipoDireccionEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the TipoDireccionEntidad class.
		/// </summary>
		public TipoDireccionEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the TipoDireccionEntidad class.
		/// </summary>
		public TipoDireccionEntidad(int idTipoDireccion, string descripcionDireccion, DateTime? fecBaja)
		{
			this.IdTipoDireccion = idTipoDireccion;
			this.DescripcionDireccion = descripcionDireccion;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdTipoDireccion value.
		/// </summary>
		public int IdTipoDireccion { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionDireccion value.
		/// </summary>
		public string DescripcionDireccion { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
