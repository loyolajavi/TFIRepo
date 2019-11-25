using System;
using System.Collections.Generic;
using TFI.Entidades.Servicios.Permisos;

namespace TFI.Entidades
{
    public class UsuarioEntidad
    {
        public int IdUsuario { get; set; }
        private int? _IdCondicionFiscal = 1;
        public int? IdCondicionFiscal 
        {
            get
            {
                return _IdCondicionFiscal;
            }
            set
            {
                _IdCondicionFiscal = value;
            }
        }
        
        
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string NroIdentificacion { get; set; }
        public string CUIT { get; set; }
        public string Email { get; set; }
        public string NombreUsuario { get; set; }
        public string Clave { get; set; }
        public int IdUsuarioTipo { get; set; }

        public DateTime? FecBaja { get; set; }
        public List<TarjetaEntidad> misTarjetas { get; set; }
        public List<DireccionEntidad> misDirecciones { get; set; }
        public CondicionFiscalEntidad micondFiscal { get; set; }
        public List<ListaDeseoEntidad> misDeseos { get; set; }
        public string URI { get; set; }

        private FamiliaEntidad _Familia = new FamiliaEntidad();

        public FamiliaEntidad Familia 
        {
            get
            {
                return _Familia;
            }
            set
            {
                _Familia = value;
            }
        }


        private List<IFamPat> _Permisos = new List<IFamPat>();

        public List<IFamPat> Permisos
        {
            get { return _Permisos; }
            set { _Permisos = value; }
        }

         

    }
}
