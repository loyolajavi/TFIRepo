using System.Collections.Generic;
using TFI.DAL.DAL;
using TFI.CORE.Helpers;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class ProductoCore
    {
        private ProductoDAL _productoDal = new ProductoDAL();
        private ProdCategoriaDAL _prodCategoriaDal = new ProdCategoriaDAL();
        private MarcaDAL _marcaDal = new MarcaDAL();
        private CategoriaDAL _categoriaDal = new CategoriaDAL();

        public void ProductoCORE()
        {
            _productoDal = new ProductoDAL();
        }

        public Entidades.ProductoEntidad Find(int id)
        {
            return _productoDal.Select(ConfigSection.Default.Site.Cuit, id);
        }

        public List<Entidades.ProductoEntidad> FindAll()
        {
            return _productoDal.SelectAll();
        }

        public List<Entidades.ProductoEntidad> FindAllByCUIT()
        {
            return _productoDal.SelectAllByCUIT(ConfigSection.Default.Site.Cuit);
        }

        public List<Entidades.ProductoEntidad> FindAllByDescripProducto(string DescripProducto)
        {
            return _productoDal.ProductoSelectByDescripProducto(Helpers.ConfigSection.Default.Site.Cuit, DescripProducto);
        }

        public List<Entidades.ProductoEntidad> ProductoSelectMasVendidosByCUIT(string cuit)
        {
            return _productoDal.ProductoSelectMasVendidosByCUIT(cuit);
        }

        public void ProdCategoriaDeleteByProducto(int idproducto)
        {

            _prodCategoriaDal.DeleteAllByIdProducto(idproducto);
        }

        public void ProductoDelete(int idproducto)
        {

            _productoDal.Delete(idproducto);
        }

        public void ProductoUpdate(ProductoEntidad prod)
        {

            _productoDal.Update(prod);
        }

        public int ProductoInsert(ProductoEntidad prod)
        {

            return _productoDal.Insert(prod);
        }

        public void ProductoCategoriaInsert(ProdCategoriaEntidad prodcat)
        {
            _prodCategoriaDal.Insert(prodcat);
        }

        public MarcaEntidad MarcaSelect(int idMarca)
        {
            return _marcaDal.Select(idMarca);
        }

        public List<CategoriaEntidad> ProductoSelectAllCategorias(int idproducto)
        {
            List<CategoriaEntidad> ListaDeCategoriasDeProducto = new List<CategoriaEntidad>();
            var listadeintermedias = _prodCategoriaDal.SelectAllByIdProducto(idproducto);
            foreach (var item in listadeintermedias)
            {
                var categoria = _categoriaDal.Select(item.IdCategoria);
                ListaDeCategoriasDeProducto.Add(categoria);
            }

            return ListaDeCategoriasDeProducto;
        }


        public List<ProductoEntidad> ProductoSelectByCategoria(int idCategoria)
        {
            return _productoDal.ProductoSelectByCategoria(ConfigSection.Default.Site.Cuit, idCategoria);
        }


    }
}
