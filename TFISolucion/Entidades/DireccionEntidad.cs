using System;

namespace TFI.Entidades
{
	public class DireccionEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdDireccion value.
		/// </summary>
		public int IdDireccion { get; set; }

		/// <summary>
		/// Gets or sets the Calle value.
		/// </summary>
		public string Calle { get; set; }

		/// <summary>
		/// Gets or sets the Numero value.
		/// </summary>
		public int Numero { get; set; }

		/// <summary>
		/// Gets or sets the Piso value.
		/// </summary>
		public int Piso { get; set; }

		/// <summary>
		/// Gets or sets the Departamento value.
		/// </summary>
		public string Departamento { get; set; }

		/// <summary>
		/// Gets or sets the Localidad value.
		/// </summary>
		public string Localidad { get; set; }

		/// <summary>
		/// Gets or sets the IdProvincia value.
		/// </summary>
		public int IdProvincia { get; set; }

		/// <summary>
		/// Gets or sets the IdTipoDireccion value.
		/// </summary>
		public int IdTipoDireccion { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

        public ProvinciaEntidad Provincia { get; set; }
		#endregion
	}
}
