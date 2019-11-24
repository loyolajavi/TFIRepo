using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.Servicios.Permisos
{
    public interface IFamPat
    {

        int IdIFamPat { get; set; }
        string NombreIFamPat { get; set; }

        void Agregar(IFamPat ElementoFamPat);
        void Quitar(IFamPat ElementoFamPat);

        int CantHijos { get; }

    }
}
