using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades
{
    public class Adquisicion
    {
        public int IdAdquisicion { get; set; }
        public SucursalEntidad miSucursal { get; set; }
        public string NroRemito { get; set; }
        public List<AdquisicionDetalle> misAdqDetalles { get; set; }

    }
}
