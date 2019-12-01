using System;
using System.Collections.Generic;

namespace TFI.Entidades
{
	public class ProvinciaEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdProvincia value.
		/// </summary>
		public int IdProvincia { get; set; }

		/// <summary>
		/// Gets or sets the DescripcionProvincia value.
		/// </summary>
		public string DescripcionProvincia { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

        public List<Localidad> misLocalidades { get; set; }

		#endregion
	}
}
