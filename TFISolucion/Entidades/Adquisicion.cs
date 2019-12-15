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
        public string CUIT { get; set; }
        public SucursalEntidad miSucursal { get; set; }
        public string NroRemito { get; set; }

        public DateTime miFecha { get; set; }
        
        private List<AdquisicionDetalle> _misAdqDetalles = new List<AdquisicionDetalle>();
        public List<AdquisicionDetalle> MisAdqDetalles
        {
            get { return _misAdqDetalles; }
            set { _misAdqDetalles = value; }
        }
        
        public void AgregarDetalle(ProductoEntidad elProd, int laCantidad)
        {
            _misAdqDetalles.Add(new AdquisicionDetalle(elProd, laCantidad));
        }

    }
}
