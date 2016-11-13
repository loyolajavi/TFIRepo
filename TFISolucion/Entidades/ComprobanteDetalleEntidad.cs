using System;

namespace TFI.Entidades
{
    public class ComprobanteDetalleEntidad
    {
        public int IdComprobanteDetalle { get; set; }
        public int NroComprobante { get; set; }
        public int IdSucursal { get; set; }
        public int IdTipoComprobante { get; set; }
        public string CUIT { get; set; }
        public int IdProducto { get; set; }
        public int CantidadProducto { get; set; }
        public decimal PrecioUnitarioFact { get; set; }
        public DateTime? FecBaja { get; set; }

        public ComprobanteEntidad Comprobante { get; set; }
    }
}