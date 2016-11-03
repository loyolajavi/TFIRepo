using System;

namespace TFI.Entidades
{
	public class LenguajeEntidad
	{
		

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


        //ESTO ES LO QUE TENIA PACHU EN LA CLASE LENGUAJE DEL BRANCH DEV
        //public string Control { get; set; }
        //public string IsoCode { get; set; }
        //public string Value { get; set; }

		#endregion
	}
}
