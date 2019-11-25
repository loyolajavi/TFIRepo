using System;
using System.Collections.Generic;

namespace TFI.Entidades
{
	public class EmpresaEntidad
	{


		#region Properties
		/// <summary>
		/// Gets or sets the CUIT value.
		/// </summary>
		public string CUIT { get; set; }

		/// <summary>
		/// Gets or sets the NombreEmpresa value.
		/// </summary>
		public string NombreEmpresa { get; set; }
        public List<SucursalEntidad> misSucursales { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
