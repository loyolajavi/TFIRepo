using System;

namespace TFI.Entidades
{
	public class LenguajeEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the LenguajeEntidad class.
		/// </summary>
		public LenguajeEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the LenguajeEntidad class.
		/// </summary>
		public LenguajeEntidad(string descripcionLenguaje, DateTime? fecBaja)
		{
			this.DescripcionLenguaje = descripcionLenguaje;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the LenguajeEntidad class.
		/// </summary>
		public LenguajeEntidad(int idLenguaje, string descripcionLenguaje, DateTime? fecBaja)
		{
			this.IdLenguaje = idLenguaje;
			this.DescripcionLenguaje = descripcionLenguaje;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdLenguaje value.
		/// </summary>
		public int IdLenguaje { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionLenguaje value.
		/// </summary>
		public string DescripcionLenguaje { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
