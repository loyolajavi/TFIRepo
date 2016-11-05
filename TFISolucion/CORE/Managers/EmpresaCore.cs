using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class EmpresaCore
    {

        private EmpresaDAL DaldeEmpresa = new EmpresaDAL();
        private MarcaDAL DaldeMarca = new MarcaDAL();
        private IvaProductoDAL DaldeIvaProducto = new IvaProductoDAL();
        private CategoriaDAL DaldeCategoria = new CategoriaDAL();

        private LenguajeControlDAL DaldeLenguaje = new LenguajeControlDAL();

        public EmpresaEntidad EmpresaSelectByCuit(string cuit)
        {

            return DaldeEmpresa.Select(cuit);
        }

        public LenguajeControlEntidad SeleccionarContenidoEmpresa(string cuit, string texto, int lenguaje)
        {

            return DaldeLenguaje.Select(texto, lenguaje, cuit);
        }

        public void ActualizarContenidoEmpresa(LenguajeControlEntidad LenguajeControl)
        {
            DaldeLenguaje.Update(LenguajeControl);
        }

        public List<MarcaEntidad> SeleccionarMarcas()
        {
            return DaldeMarca.SelectAll();
        }

        public List<IvaProductoEntidad> SeleccionarIvaProducto()
        {
            return DaldeIvaProducto.SelectAll();
        }

        public List<CategoriaEntidad> SeleccionarCategorias(string CUIT)
        {
            return DaldeCategoria.CategoriaSelectAllByCUIT(CUIT);
        }



    }
}
