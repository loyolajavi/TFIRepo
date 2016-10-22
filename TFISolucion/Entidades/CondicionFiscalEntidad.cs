using System;

namespace TFI.Entidades
{
	public class CondicionFiscalEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the CondicionFiscalEntidad class.
		/// </summary>
		public CondicionFiscalEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the CondicionFiscalEntidad class.
		/// </summary>
		public CondicionFiscalEntidad(string descripcion, DateTime? fecBaja)
		{
			this.Descripcion = descripcion;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the CondicionFiscalEntidad class.
		/// </summary>
		public CondicionFiscalEntidad(int idCondicionFiscal, string descripcion, DateTime? fecBaja)
		{
			this.IdCondicionFiscal = idCondicionFiscal;
			this.Descripcion = descripcion;
			this.FecBaja = fecBaja;
		}

		#endregion

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
