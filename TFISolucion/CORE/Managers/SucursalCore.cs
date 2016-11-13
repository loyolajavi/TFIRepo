using System.Collections.Generic;
using TFI.DAL.DAL;
using System.Linq;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class SucursalCore
    {
        private SucursalDAL _dal;
        private DireccionCore _direccionCore;

        public SucursalCore()
        {
            _dal = new SucursalDAL();
            _direccionCore = new DireccionCore();
        }

        public List<SucursalEntidad> FindAll()
        {
            var sucursales = _dal.SelectAllByCUIT(Helpers.ConfigSection.Default.Site.Cuit);
            var direcciones = _direccionCore.FindAll();

            sucursales.ForEach(x => x.Direccion = direcciones.Where(d => d.IdDireccion == x.DireccionSucursal).FirstOrDefault());

            return sucursales;
        }
    }
}