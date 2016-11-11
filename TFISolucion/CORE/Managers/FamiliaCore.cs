using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;
using TFI.CORE.Helpers;

namespace TFI.CORE.Managers
{
    public class FamiliaCore
    {

        private FamiliaDAL unaFamiliaDAL;

        public FamiliaCore()
        {
            unaFamiliaDAL = new FamiliaDAL();
        }

        public List<FamiliaEntidad> FamiliaSelectAll()
        {
            return unaFamiliaDAL.SelectAll();
        }

        public FamiliaEntidad FamiliaSelectNombreFamiliaByIdUsuario(int idUsuario)
        {
            return unaFamiliaDAL.FamiliaSelectNombreFamiliaByIdUsuario(idUsuario);
        }

    }
}
