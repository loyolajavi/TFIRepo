using System;

namespace TFI.Entidades
{
	public class FamiliaEntidad
	{

		#region Properties
		/// <summary>
		/// Gets or sets the IdFamilia value.
		/// </summary>
        public PermisoFamilia IdFamilia { get; set; }

		

		/// <summary>
		/// Gets or sets the NombreFamilia value.
		/// </summary>
		public string NombreFamilia { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }


        public enum PermisoFamilia : int
        {
            Publico = 1, Cliente = 2, Empleado = 3, Admin = 4
        }

		#endregion
	}
}
