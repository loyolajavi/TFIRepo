using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class PedidoCore
    {

        private PedidoDAL PedidoDal = new PedidoDAL();
        private PedidoEstadoPedidoDAL PedidoEstadoDAL = new PedidoEstadoPedidoDAL();
        private PedidoDetalleDAL PedidoDetalleDAL = new PedidoDetalleDAL();
        private EstadoPedidoDAL EstadoPedidoDal = new EstadoPedidoDAL();

        public List<PedidoEntidad> SelectAllByCUIT_NombreUsuario(string cuit, string nombreUsuario)
        {
            return PedidoDal.SelectAllByCUIT_NombreUsuario(cuit, nombreUsuario);
        }

        public PedidoEstadoPedidoEntidad PedidoUltimoEstadoSelect(int idPedido)
        {
            return PedidoEstadoDAL.PedidoUltimoEstadoSelect(idPedido);
        }

        //Para obtener la descripcion del estado a partir del id
        public EstadoPedidoEntidad EstadoPedidoSelect(int idEstadoPedido)
        {
            return EstadoPedidoDal.Select(idEstadoPedido);
        }

        public PedidoEntidad PedidoSelectByCUIT_NroPedido(string cuit, Int64 nropedido)
        {

            return PedidoDal.SelectByCUIT_NroPedido(cuit, nropedido);

        }

        public List<PedidoDetalleEntidad> PedidosDetalleSelect(int idPedido)
        {

            return PedidoDetalleDAL.SelectAllByIdPedido(idPedido);

        }
        public List<PedidoEntidad> SelectAllByCUIT(string CUIT)
        {
            // CUIT = "20310708071";
            return PedidoDal.SelectAllByCUIT(CUIT);


        }



    }
}
