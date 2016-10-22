using System;

namespace TFI.Entidades
{
	public class FormaEntregaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the FormaEntregaEntidad class.
		/// </summary>
		public FormaEntregaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the FormaEntregaEntidad class.
		/// </summary>
		public FormaEntregaEntidad(string descripcionFormaEntrega, DateTime? fecBaja)
		{
			this.DescripcionFormaEntrega = descripcionFormaEntrega;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the FormaEntregaEntidad class.
		/// </summary>
		public FormaEntregaEntidad(int idFormaEntrega, string descripcionFormaEntrega, DateTime? fecBaja)
		{
			this.IdFormaEntrega = idFormaEntrega;
			this.DescripcionFormaEntrega = descripcionFormaEntrega;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdFormaEntrega value.
		/// </summary>
		public int IdFormaEntrega { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionFormaEntrega value.
		/// </summary>
		public string DescripcionFormaEntrega { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
