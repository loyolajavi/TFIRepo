using System;

namespace TFI.Entidades
{
	public class ControladorEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the ControladorEntidad class.
		/// </summary>
		public ControladorEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the ControladorEntidad class.
		/// </summary>
		public ControladorEntidad(int? idEmpresa, string pagina, string controlador, string descripcion, DateTime? FecBaja)
		{
			this.IdEmpresa = idEmpresa;
			this.Pagina = pagina;
			this.Controlador = controlador;
			this.Descripcion = descripcion;
            this.FecBaja = FecBaja;
		}

		/// <summary>
		/// Initializes a new instance of the ControladorEntidad class.
		/// </summary>
		public ControladorEntidad(int idControlador, int? idEmpresa, string pagina, string controlador, string descripcion, DateTime? FecBaja)
		{
			this.IdControlador = idControlador;
			this.IdEmpresa = idEmpresa;
			this.Pagina = pagina;
			this.Controlador = controlador;
			this.Descripcion = descripcion;
            this.FecBaja = FecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the IdControlador value.
		/// </summary>
		public int IdControlador { get; set; }

		/// <summary>
		/// Gets or sets the IdEmpresa value.
		/// </summary>
		public int? IdEmpresa { get; set; }

		/// <summary>
		/// Gets or sets the Pagina value.
		/// </summary>
		public string Pagina { get; set; }

		/// <summary>
		/// Gets or sets the Controlador value.
		/// </summary>
		public string Controlador { get; set; }

		/// <summary>
		/// Gets or sets the Descripcion value.
		/// </summary>
		public string Descripcion { get; set; }

        public DateTime? FecBaja { get; set; }

		#endregion
	}
}
