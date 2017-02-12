using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades
{
    public class ReportePedidosPorFechayEstado
    {
        public Int64 Pedido { get; set; }

        /// <summary>
        /// Gets or sets the DescripcionProvincia value.
        /// </summary>
        public DateTime Fecha { get; set; }

        /// <summary>
        /// Gets or sets the FecBaja value.
        /// </summary>
        public string Usuario { get; set; }

        public string Estado { get; set; }
    }
}
