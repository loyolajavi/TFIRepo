using System;

namespace TFI.Entidades
{
	public class MarcaEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdMarca value.
		/// </summary>
		public int IdMarca { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionMarca value.
		/// </summary>
		public string DescripcionMarca { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
