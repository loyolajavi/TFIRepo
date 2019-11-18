using System;
using System.Collections.Generic;
using System.Linq;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class PedidoCore
    {
        private PedidoDAL GestorPedido = new PedidoDAL();
        private PedidoEstadoPedidoDAL _pedidoEstadoPedidoDal;
        private PedidoEstadoPedidoDAL PedidoEstadoDAL = new PedidoEstadoPedidoDAL();
        private PedidoDetalleDAL PedidoDetalleDAL = new PedidoDetalleDAL();
        private EstadoPedidoDAL GestorEstadoPedido = new EstadoPedidoDAL();

        public PedidoCore()
        {
            _pedidoEstadoPedidoDal = new PedidoEstadoPedidoDAL();
        }

        public List<PedidoEntidad> SelectAllByCUIT_NombreUsuario(string nombreUsuario)
        {
            List<PedidoEntidad> unosPedidos = new List<PedidoEntidad>();
            unosPedidos = GestorPedido.SelectAllByCUIT_NombreUsuario(Helpers.ConfigSection.Default.Site.Cuit, nombreUsuario);
            foreach (PedidoEntidad unPedido in unosPedidos)
            {
                PedidoTraerEstadoActual(unPedido);
                //unPedido.Estado = GestorPedido.PedidoTraerEstadoActual(unPedido.IdPedido);
            }
            return unosPedidos;
        }
        //public PedidoEstadoPedidoEntidad PedidoUltimoEstadoSelect(int idPedido)
        //{
        //    return PedidoEstadoDAL.PedidoUltimoEstadoSelect(idPedido);
        //}

        public void PedidoTraerEstadoActual(PedidoEntidad elPedido)
        {
            GestorPedido.PedidoTraerEstadoActual(elPedido);
        }

        //public PedidoEntidad PedidoTraerEstadoActual(int IdPedido)
        //{
        //    return PedidoSelectByCUIT_IDPedido(IdPedido);
        //}

        //Para obtener la descripcion del estado a partir del id
        public EstadoPedidoEntidad EstadoPedidoSelect(int idEstadoPedido)
        {
            return GestorEstadoPedido.Select(idEstadoPedido);
        }

        public PedidoEntidad PedidoSelectByCUIT_NroPedido(string cuit, Int64 nropedido)
        {
            PedidoEntidad unPedido = new PedidoEntidad();
            unPedido = GestorPedido.SelectByCUIT_NroPedido(cuit, nropedido);
            PedidoTraerEstadoActual(unPedido);
            return unPedido;
        }

        public PedidoEntidad PedidoSelectByCUIT_IDPedido(Int64 elIdPedido)
        {
            PedidoEntidad unPedido = new PedidoEntidad();
            unPedido = GestorPedido.PedidoSelectByCUIT_IDPedido(Helpers.ConfigSection.Default.Site.Cuit, elIdPedido);
            PedidoTraerEstadoActual(unPedido);
            return unPedido;
        }

        public List<PedidoDetalleEntidad> PedidosDetalleSelect(int idPedido)
        {
            return PedidoDetalleDAL.SelectAllByIdPedido(idPedido);
        }

        public List<PedidoEntidad> SelectAllByCUIT(string CUIT)
        {
            List<PedidoEntidad> unosPedidos = new List<PedidoEntidad>();
            unosPedidos = GestorPedido.SelectAllByCUIT(CUIT);
            foreach (PedidoEntidad unPedido in unosPedidos)
            {
                PedidoTraerEstadoActual(unPedido);
            }
            return unosPedidos;
        }

        public List<EstadoPedidoEntidad> EstadoPedidoSelectAll()
        {
            return GestorEstadoPedido.SelectAll();
        }



        public PedidoEntidad Create(PedidoEntidad unPedido, int? IdSucursal)
        {
            unPedido.NroPedido = GetLastNroPedido();
            var idPedido = GestorPedido.Insert(unPedido);
            unPedido.IdPedido = idPedido;
            //Esto esta OK para grabar el estado del pedido incluso ya con lo de StatePedido
            _pedidoEstadoPedidoDal.Insert(new PedidoEstadoPedidoEntidad()
            {
                Fecha = unPedido.FechaPedido,
                IdEstadoPedido = (int)EstadoPedidoEntidad.Options.PendientePago,
                IdPedido = idPedido
            });

            unPedido.Detalles.ForEach(d => d.IdPedido = idPedido);
            unPedido.Detalles.ForEach(x => PedidoDetalleDAL.Insert(x));

            SucursalCore ManagerSucursal = new SucursalCore();
            ManagerSucursal.DescontarStockSucursal(unPedido.Detalles, IdSucursal);
           
            return unPedido;
        }

        private long GetLastNroPedido()
        {
            long? idAnterior = GestorPedido.SelectAllByCUIT(Helpers.ConfigSection.Default.Site.Cuit)
                .OrderByDescending(x => x.NroPedido)
                .Select(x => x.NroPedido)
                .FirstOrDefault();

            return idAnterior.HasValue ? idAnterior.Value + 1 : 1;
        }


        public void AvanzarPaso(PedidoEntidad elPedido, ComprobanteEntidad elComprobante)
        {
            elPedido.Avanzar(false, elPedido.miFormaEntrega.IdFormaEntrega);
            PedidoSetearEstadoDescripEnMemoria(elPedido);

            //Si se pagó
            if (elPedido.VerEstadoActual().IdEstadoPedido == (int)EstadoPedidoEntidad.Options.Pago)
            {
                //Generar factura
                ComprobanteCore unManagerComprobante = new ComprobanteCore();
                unManagerComprobante.Create(elComprobante);

                //Insertar nuevo estado
                _pedidoEstadoPedidoDal.Insert(new PedidoEstadoPedidoEntidad()
                {
                    Fecha = DateTime.Now,
                    IdEstadoPedido = elPedido.VerEstadoActual().IdEstadoPedido,
                    IdPedido = elPedido.IdPedido
                });

            }

            //if (elPedido.VerEstadoActual().GetType() == typeof(Entidades.StatePatron.StatePendientePago))
            //    PedidoEstadoDAL.SelectAll();
            //else if(elPedido.VerEstadoActual().GetType() == typeof(Entidades.StatePatron.StatePago))
            //    PedidoEstadoDAL.SelectAll();

            //Podría llegar a usar este código
            //pedidoEstadoPedido.IdPedido = (int)Current.Session["UltimoPedido"];
            //pedidoEstadoPedido.IdEstadoPedido = 6;//Finalizado
            //pedidoEstadoPedido.Fecha = DateTime.Now;

        }

        public void PedidoSetearEstadoDescripEnMemoria(PedidoEntidad elPedido)
        {
            EstadoPedidoEntidad unEstadoPedido = new EstadoPedidoEntidad();
            switch ((string)elPedido.VerEstadoActual().GetType().Name)
            {
                case "StatePendientePago":
                    unEstadoPedido = GestorEstadoPedido.Select((int)EstadoPedidoEntidad.Options.PendientePago);
                    break;
                case "StatePago":
                    unEstadoPedido = GestorEstadoPedido.Select((int)EstadoPedidoEntidad.Options.Pago);
                    break;
                case "StateEnCamino":
                    unEstadoPedido = GestorEstadoPedido.Select((int)EstadoPedidoEntidad.Options.EnCamino);
                    break;
                case "StateListoParaRetirar":
                    unEstadoPedido = GestorEstadoPedido.Select((int)EstadoPedidoEntidad.Options.ListoRetirar);
                    break;
                case "StateEntregado":
                    unEstadoPedido = GestorEstadoPedido.Select((int)EstadoPedidoEntidad.Options.Entregado);
                    break;
                case "StateCancelado":
                    unEstadoPedido = GestorEstadoPedido.Select((int)EstadoPedidoEntidad.Options.Cancelado);
                    break;
            }
            elPedido.VerEstadoActual().IdEstadoPedido = unEstadoPedido.IdEstadoPedido;
            elPedido.VerEstadoActual().DescripcionEstadoPedido = unEstadoPedido.DescripcionEstadoPedido;
        }


    }
}