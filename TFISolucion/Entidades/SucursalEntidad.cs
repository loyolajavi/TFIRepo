using System;

namespace TFI.Entidades
{
    public class SucursalEntidad
    {
        public int IdSucursal { get; set; }
        public string DescripSucursal { get; set; }
        public DireccionEntidad miDireccion { get; set; }
        public string CUIT { get; set; }
        public DateTime? FecBaja { get; set; }

        public DireccionEntidad Direccion { get; set; }
    }
}