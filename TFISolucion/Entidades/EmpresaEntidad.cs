using System;

namespace TFI.Entidades
{
	public class EmpresaEntidad
	{
		#region Constructors

		/// <summary>
		/// Initializes a new instance of the EmpresaEntidad class.
		/// </summary>
		public EmpresaEntidad()
		{
		}

		/// <summary>
		/// Initializes a new instance of the EmpresaEntidad class.
		/// </summary>
		public EmpresaEntidad(int cUIT, string nombreEmpresa, DateTime? fecBaja)
		{
			this.CUIT = cUIT;
			this.NombreEmpresa = nombreEmpresa;
			this.FecBaja = fecBaja;
		}

		#endregion

		#region Properties
		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public int CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreEmpresa value.
		/// </summary>
		public string NombreEmpresa { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
