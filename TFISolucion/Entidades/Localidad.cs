using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades
{
    public class Localidad
    {

        public int IdLocalidad { get; set; }
        public string DescripcionLocalidad { get; set; }
        public ProvinciaEntidad miProvincia { get; set; }

    }
}
