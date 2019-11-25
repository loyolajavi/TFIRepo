using System;

namespace TFI.Entidades
{
	public class TelefonoEntidad
	{

		#region Properties
		
		public UsuarioEntidad miUsuario { get; set; }

		/// <summary>
		/// Gets or sets the NroTelefono value.
		/// </summary>
		public string NroTelefono { get; set; }

		/// <summary>
		/// Gets or sets the CodArea value.
		/// </summary>
		public string CodArea { get; set; }

		/// <summary>
		/// Gets or sets the IdTipoTel value.
		/// </summary>
        public TipoTelEntidad miTipoTel { get; set; }

		/// <summary>
		/// Gets or sets the FecBaja value.
		/// </summary>
		public DateTime? FecBaja { get; set; }

		#endregion
	}
}
