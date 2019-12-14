using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades
{
    public class AdquisicionDetalle
    {
        public ProductoEntidad miProducto { get; set; }
        public int Cantidad { get; set; }
        public int Ajuste { get; set; }

    }
}
