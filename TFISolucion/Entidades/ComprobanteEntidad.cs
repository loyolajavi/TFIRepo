using System;
using System.Collections.Generic;

namespace TFI.Entidades
{
    public class ComprobanteEntidad
    {
        public int NroComprobante { get; set; }
        public int IdSucursal { get; set; }
        public string CUIT { get; set; }
        public int IdTipoComprobante { get; set; }
        public int IdComprobante { get; set; }
        public DateTime FechaComprobante { get; set; }
        public int IdPedido { get; set; }
        public DateTime? FecBaja { get; set; }

        public decimal Ajuste { get; set; }

        public List<ComprobanteDetalleEntidad> Detalles { get; set; }
    }
}