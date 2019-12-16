using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades
{
    public class AdquisicionDetalle
    {

        public AdquisicionDetalle(ProductoEntidad elProd, int laCantidad, int elAjuste = 0)
        {
            miProducto = elProd;
            Cantidad = laCantidad;
            Ajuste = elAjuste;
        }

        public int IdAdquisicionDetalle { get; set; }
        public ProductoEntidad miProducto { get; set; }
        public int Cantidad { get; set; }
        public int Ajuste { get; set; }

    }
}
