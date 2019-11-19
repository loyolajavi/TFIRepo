using System.Collections.Generic;
using TFI.DAL.DAL;
using System.Linq;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class SucursalCore
    {
        private SucursalDAL GestorSucursal;
        private DireccionCore _direccionCore;

        public SucursalCore()
        {
            GestorSucursal = new SucursalDAL();
            _direccionCore = new DireccionCore();
        }

        public List<SucursalEntidad> FindAll()
        {
            var sucursales = GestorSucursal.SelectAllByCUIT(Helpers.ConfigSection.Default.Site.Cuit);
            var direcciones = _direccionCore.FindAll();

            sucursales.ForEach(x => x.Direccion = direcciones.Where(d => d.IdDireccion == x.DireccionSucursal).FirstOrDefault());

            return sucursales;
        }



        public List<SucursalEntidad> TraerSucursalesConStock(List<PedidoDetalleEntidad> unosPedidosDetalles)
        {
            List<StockSucursalEntidad> sucursalesPorProducto = new List<StockSucursalEntidad>();
            List<StockSucursalEntidad> sucursalesTodoPedido = new List<StockSucursalEntidad>();
            List<SucursalEntidad> sucursalesRetorno = new List<SucursalEntidad>();

            sucursalesRetorno = FindAll();

            //Si la sucursal tiene todos los productos con sus cantidades indicadas en el pedido, se suma a la lista
            bool flag = false;
            foreach (PedidoDetalleEntidad unPedDet in unosPedidosDetalles)
            {
                sucursalesPorProducto = GestorSucursal.TraerSucursalesConStock(unPedDet.IdProducto, unPedDet.Cantidad, Helpers.ConfigSection.Default.Site.Cuit);

                if (sucursalesPorProducto != null && sucursalesPorProducto.Count > 0)
                {
                    if (!flag)
                        sucursalesTodoPedido = sucursalesPorProducto.ToList();
                    else
                        sucursalesTodoPedido = sucursalesTodoPedido.Where(d => sucursalesPorProducto.Any(a => a.IdSucursal == d.IdSucursal)).ToList();
                }
                flag = true;
            }

            sucursalesRetorno = sucursalesRetorno.Where(d => sucursalesTodoPedido.Any(a => a.IdSucursal == d.IdSucursal)).ToList();

            //var direcciones = _direccionCore.FindAll();

            //sucursalesTodoPedido.ForEach(x => x.Direccion = direcciones.Where(d => d.IdDireccion == x.DireccionSucursal).FirstOrDefault());

            return sucursalesRetorno;
        }





        public void DescontarStockSucursal(List<PedidoDetalleEntidad> unosPedidosDetalles, int? IdSucursal)
        {
            try
            {
                foreach (PedidoDetalleEntidad unPedDet in unosPedidosDetalles)
                {
                    GestorSucursal.DescontarStockSucursal(unPedDet, IdSucursal, Helpers.ConfigSection.Default.Site.Cuit);    
                }
            }
            catch (System.Exception es)
            {
                throw;
            }
        }


        public SucursalEntidad SucursalTraerPorDireccionSucursal(int laDireccionSucursal)
        {
            try
            {
                return GestorSucursal.SucursalTraerPorDireccionSucursal(Helpers.ConfigSection.Default.Site.Cuit, laDireccionSucursal);
            }
            catch (System.Exception es)
            {
                throw;
            }
            

            
        }


    }
}