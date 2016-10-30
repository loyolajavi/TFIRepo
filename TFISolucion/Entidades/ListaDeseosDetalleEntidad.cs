using System;

namespace TFI.Entidades
{
	public class ListaDeseosDetalleEntidad
	{


		#region Properties
		/// <summary>
		/// Gets or sets the IdListaDeseos value.
		/// </summary>
		public int IdListaDeseos { get; set; }

		/// <summary>
		/// Gets or sets the IdListaDeseosDetalle value.
		/// </summary>
		public int IdListaDeseosDetalle { get; set; }

		/// <summary>
		/// Gets or sets the IdProducto value.
		/// </summary>
		public int IdProducto { get; set; }

		/// <summary>
		/// Gets or sets the FechaDeseoDetalle value.
		/// </summary>
		public DateTime FechaDeseoDetalle { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }


        public string CUIT { get; set; }

		#endregion
	}
}
