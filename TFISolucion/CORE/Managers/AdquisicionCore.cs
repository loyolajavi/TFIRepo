using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.CORE.Helpers;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{

    public class AdquisicionCore
    {
        private AdquisicionDAL GestorAdquisicion = new AdquisicionDAL();

        public void Create(Adquisicion laAdquisicion)
        {
            try
            {
                //Crear Adquisicion
                laAdquisicion.IdAdquisicion = GestorAdquisicion.Insert(laAdquisicion);

                //CrearDetalles
                GestorAdquisicion.InsertDetalles(laAdquisicion);

                //AumentarStock
                StockCore ManagerStock = new StockCore();

                foreach (AdquisicionDetalle item in laAdquisicion.MisAdqDetalles)
                {
                    StockSucursalEntidad unStock = ManagerStock.Select(item.miProducto.IdProducto, laAdquisicion.miSucursal.IdSucursal, laAdquisicion.CUIT);
                    if (unStock != null && unStock.IdProducto > 0)
                        //Update si ya existe el registro de stock
                        ManagerStock.Update(new StockSucursalEntidad(item.miProducto.IdProducto, laAdquisicion.miSucursal.IdSucursal, item.Cantidad, laAdquisicion.CUIT));
                    else
                        //Insert si el producto es nuevo y no tiene registro de stock
                        ManagerStock.Insert(new StockSucursalEntidad(item.miProducto.IdProducto, laAdquisicion.miSucursal.IdSucursal, item.Cantidad, laAdquisicion.CUIT));
                }
            }
            catch (Exception)
            {
                throw;
            }
        }



    }
}
