using System;

namespace TFI.Entidades
{
	public class CondicionFiscalEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdCondicionFiscal value.
		/// </summary>
		public int IdCondicionFiscal { get; set; }

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
