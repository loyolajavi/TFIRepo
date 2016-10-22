using System;

namespace TFI.Entidades
{
	public class DireccionEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the DireccionEntidad class.
		/// </summary>
		public DireccionEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the DireccionEntidad class.
		/// </summary>
		public DireccionEntidad(string calle, int numero, int? piso, string departamento, string localidad, int idProvincia, int idTipoDireccion, DateTime? fecBaja)
		{
			this.Calle = calle;
			this.Numero = numero;
			this.Piso = piso;
			this.Departamento = departamento;
			this.Localidad = localidad;
			this.IdProvincia = idProvincia;
			this.IdTipoDireccion = idTipoDireccion;
			this.FecBaja = fecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the DireccionEntidad class.
		/// </summary>
		public DireccionEntidad(int idDireccion, string calle, int numero, int? piso, string departamento, string localidad, int idProvincia, int idTipoDireccion, DateTime? fecBaja)
		{
			this.IdDireccion = idDireccion;
			this.Calle = calle;
			this.Numero = numero;
			this.Piso = piso;
			this.Departamento = departamento;
			this.Localidad = localidad;
			this.IdProvincia = idProvincia;
			this.IdTipoDireccion = idTipoDireccion;
			this.FecBaja = fecBaja;
		}

		#endregion

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
		public int? Piso { get; set; }

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

		#endregion
	}
}
