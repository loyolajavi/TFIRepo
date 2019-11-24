using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.Entidades.Servicios.Permisos
{
    public class Familia : IFamPat
    {
        private int _IdFamilia;
        public int IdIFamPat
        {
            get { return _IdFamilia; }

            set { _IdFamilia = value; }
        }

        private string _NombreFamilia;
        public string NombreIFamPat
        {
            get { return _NombreFamilia; }

            set { _NombreFamilia = value; }
        }

        public void Agregar(IFamPat ElementoFamPat)
        {
            this._ElementosFamPat.Add(ElementoFamPat);
        }

        public void Quitar(IFamPat ElementoFamPat)
        {
            this._ElementosFamPat.Remove(ElementoFamPat);
        }


        //La agregación para hacer el Composite a través de la interfaz IFamPat que funciona como tipo "genérico"
        private List<IFamPat> _ElementosFamPat = new List<IFamPat>();

        public List<IFamPat> ElementosFamPat
        {
            get { return this._ElementosFamPat; }
            set { this._ElementosFamPat = value; }
        }


        public int CantHijos
        {
            get { return this._ElementosFamPat.Count(); }
        }



    }
}
