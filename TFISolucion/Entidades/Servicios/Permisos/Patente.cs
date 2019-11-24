using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.Servicios.Permisos
{
    public class Patente : IFamPat
    {

        private int _IdPatente;
        public int IdIFamPat
        {
            get { return _IdPatente; }

            set { _IdPatente = value; }
        }

        private string _NombrePatente;
        public string NombreIFamPat
        {
            get { return _NombrePatente; }

            set { _NombrePatente = value; }
        }

        public void Agregar(IFamPat ElementoFamPat)
        {
            throw new NotImplementedException();
        }

        public void Quitar(IFamPat ElementoFamPat)
        {
            throw new NotImplementedException();
        }

        public int CantHijos
        {
            get { return 0; }
        }







    }
}
