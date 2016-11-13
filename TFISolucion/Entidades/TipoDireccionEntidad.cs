using System;

namespace TFI.Entidades
{
	public class TipoDireccionEntidad
	{

        public enum Options
        {
            Facturacion = 1,
            Envio = 2
        }

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
