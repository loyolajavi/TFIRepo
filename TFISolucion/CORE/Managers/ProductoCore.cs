using System.Collections.Generic;
using System.Linq;
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
        private MonedaEmpresaEntidad _monedaAnterior;
        private MonedaEmpresaEntidad _monedaActual;
        private MonedaCore _coreMoneda;

        public void ProductoCORE()
        {
            _monedaAnterior = new MonedaEmpresaEntidad();
            _monedaActual = new MonedaEmpresaEntidad();
            _coreMoneda = new MonedaCore();
            _productoDal = new ProductoDAL();
        }

        //public Entidades.ProductoEntidad Find(int id, decimal moneda)
        //{
        //    var p = _productoDal.Select(ConfigSection.Default.Site.Cuit, id);

        //    p.PrecioUnitario = p.PrecioUnitario * moneda;

        //    return p;
        //}

        public Entidades.ProductoEntidad Find(int id, int idMoneda)
        {
            _coreMoneda = new MonedaCore();
            var cotizacion = _coreMoneda.Select(idMoneda);
            ProductoEntidad nuevo = new ProductoEntidad();
            var lista = new List<ProductoEntidad>();
            var p = _productoDal.Select(ConfigSection.Default.Site.Cuit, id);
            lista.Add(p);
            nuevo = p;
            if (cotizacion.Cotizacion > 1)
                nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario / cotizacion.Cotizacion, 2);
            else
                nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario * cotizacion.Cotizacion, 2);
            return nuevo;
        }

        public List<Entidades.ProductoEntidad> FindAll()
        {
            return _productoDal.SelectAll();
        }

        //public List<Entidades.ProductoEntidad> FindAllByCUIT()
        //{
        //    return _productoDal.SelectAllByCUIT(ConfigSection.Default.Site.Cuit);
        //}
        public List<Entidades.ProductoEntidad> FindAllByCUIT(int idMoneda)
        {
            _coreMoneda = new MonedaCore();
            var cotizacion = _coreMoneda.Select(idMoneda);
            var retornaProductos = new List<ProductoEntidad>();
            var productos = _productoDal.SelectAllByCUIT(ConfigSection.Default.Site.Cuit);
            if (cotizacion.Cotizacion > 1)
            {
                foreach (ProductoEntidad p in productos)
                {
                    var pNuevo = new ProductoEntidad();
                    pNuevo = p;
                    pNuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario / cotizacion.Cotizacion, 2);
                    retornaProductos.Add(pNuevo);
                }
            }
            else
                foreach (ProductoEntidad p in productos)
                {
                    var pNuevo = new ProductoEntidad();
                    pNuevo = p;
                    pNuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario * cotizacion.Cotizacion, 2);
                    retornaProductos.Add(pNuevo);
                }


            return retornaProductos;
        }

        public List<Entidades.ProductoEntidad> FindAllByDescripProducto(string DescripProducto)
        {
            return _productoDal.ProductoSelectByDescripProducto(Helpers.ConfigSection.Default.Site.Cuit, DescripProducto);
        }
        public List<Entidades.ProductoEntidad> FindAllByDescripProducto(string DescripProducto, int idMoneda)
        {

            _coreMoneda = new MonedaCore();
            var cotizacion = _coreMoneda.Select(idMoneda);
            var retornaProductos = new List<ProductoEntidad>();
            var lista = _productoDal.ProductoSelectByDescripProducto(Helpers.ConfigSection.Default.Site.Cuit, DescripProducto);
            if (cotizacion.Cotizacion > 1)
            {
                foreach (ProductoEntidad p in lista)
                {
                    ProductoEntidad nuevo = new ProductoEntidad();
                    nuevo = p;
                    nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario / cotizacion.Cotizacion, 2);
                    retornaProductos.Add(nuevo);

                }
            }
            else
                foreach (ProductoEntidad p in lista)
                {
                    ProductoEntidad nuevo = new ProductoEntidad();
                    nuevo = p;
                    nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario * cotizacion.Cotizacion, 2);
                    retornaProductos.Add(nuevo);

                }

            return retornaProductos;
        }

        //public List<Entidades.ProductoEntidad> ProductoSelectMasVendidosByCUIT(string cuit)
        //{
        //    return _productoDal.ProductoSelectMasVendidosByCUIT(cuit);
        //}

        public List<Entidades.ProductoEntidad> ProductoSelectMasVendidosByCUIT(string cuit, int idMoneda)
        {
            _coreMoneda = new MonedaCore();
            var cotizacion = _coreMoneda.Select(idMoneda);
            var retornaProductos = new List<ProductoEntidad>();
            var lista = _productoDal.ProductoSelectMasVendidosByCUIT(cuit);
            if (cotizacion.Cotizacion > 1)
            {
                foreach (ProductoEntidad p in lista)
                {
                    ProductoEntidad nuevo = new ProductoEntidad();
                    nuevo = p;
                    nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario / cotizacion.Cotizacion, 2);
                    retornaProductos.Add(nuevo);

                }
            }
            else
                foreach (ProductoEntidad p in lista)
                {
                    ProductoEntidad nuevo = new ProductoEntidad();
                    nuevo = p;
                    nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario * cotizacion.Cotizacion, 2);
                    retornaProductos.Add(nuevo);

                }
            return retornaProductos;
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


        public List<ProductoEntidad> ProductoSelectByCategoria(int idCategoria, int idMoneda)
        {
            _coreMoneda = new MonedaCore();
            var lista = new List<ProductoEntidad>();
            var cotizacion = _coreMoneda.Select(idMoneda);
            var retornaProductos = new List<ProductoEntidad>();
            lista = _productoDal.ProductoSelectByCategoria(ConfigSection.Default.Site.Cuit, idCategoria);
            if (cotizacion.Cotizacion > 1)
            {
                foreach (ProductoEntidad p in lista)
                {
                    ProductoEntidad nuevo = new ProductoEntidad();
                    nuevo = p;
                    nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario / cotizacion.Cotizacion, 2);
                    retornaProductos.Add(nuevo);

                }
            }
            else
                foreach (ProductoEntidad p in lista)
                {
                    ProductoEntidad nuevo = new ProductoEntidad();
                    nuevo = p;
                    nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario * cotizacion.Cotizacion, 2);
                    retornaProductos.Add(nuevo);

                }
            return retornaProductos;
        }


    }
}
