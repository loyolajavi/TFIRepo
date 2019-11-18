using System;

namespace TFI.Entidades
{
	public class DireccionEntidad
	{


		public int IdDireccion { get; set; }
		public string Calle { get; set; }
		public int Numero { get; set; }
		public int? Piso { get; set; }
		public string Departamento { get; set; }
		public string Localidad { get; set; }
		public int IdProvincia { get; set; }
		public int IdTipoDireccion { get; set; }
        public TipoDireccionEntidad miTipoDireccion { get; set; }
		public DateTime? FecBaja { get; set; }
        public ProvinciaEntidad miProvincia { get; set; }
	
	}
}
