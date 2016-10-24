using System.Collections.Generic;
using TFI.DAL.DAL;

namespace TFI.CORE.Managers
{
    public class ProductoCore
    {
        private ProductoDAL _productoDal;

        public void ProductoCORE()
        {
            _productoDal = new ProductoDAL();
        }

        public Entidades.ProductoEntidad Find(int id)
        {
            return _productoDal.Select(id);
        }

        public List<Entidades.ProductoEntidad> FindAll()
        {
            return _productoDal.SelectAll();
        }

        public List<Entidades.ProductoEntidad> FindAllByCUIT(string cuit)
        {
            return _productoDal.SelectAllByCUIT(cuit);
        }

        public List<Entidades.ProductoEntidad> FindAllByDescripProducto(string DescripProducto)
        {
            return _productoDal.ProductoSelectByDescripProducto(Helpers.ConfigSection.Default.Site.Cuit, DescripProducto);
        }


    }
}
