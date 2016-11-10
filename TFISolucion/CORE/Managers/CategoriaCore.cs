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
    public class CategoriaCore
    {
        private CategoriaDAL DalDeCategoria = new CategoriaDAL();
        private ProdCategoriaDAL DalDeProdCategoria = new ProdCategoriaDAL();

        public void CategoriaInsert(CategoriaEntidad categoria)
        {
            DalDeCategoria.Insert(categoria);
        }

        public void CategoriaUpdate(CategoriaEntidad categoria)
        {
            DalDeCategoria.Update(categoria);
        }

        public void CategoriaDelete(int idcat)
        {
            DalDeCategoria.Delete(idcat);
        }

        public void CategoriaProdDelete(int idprod, int idcat)
        {
            DalDeProdCategoria.Delete(idprod, idcat);

        }

        public List<CategoriaEntidad> SeleccionarCategorias()
        {
            return DalDeCategoria.CategoriaSelectAllByCUIT(ConfigSection.Default.Site.Cuit);
        }



    }
}
