using System;

namespace TFI.Entidades
{
    public class FormaEntregaEntidad
    {
        public enum Options
        {
            Correo = 1,
            Sucursal = 2
        }

        public int IdFormaEntrega { get; set; }
        public string DescripcionFormaEntrega { get; set; }
        public DateTime? FecBaja { get; set; }
    }
}