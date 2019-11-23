using System;
using System.Collections.Generic;
using System.Linq;
using TFI.CORE.Helpers;
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

        public PedidoEntidad PedidoSelectByCUIT_NroPedidoCliente(string cuit, Int64 nropedido)
        {
            PedidoEntidad unPedido = new PedidoEntidad();
            unPedido = GestorPedido.SelectByCUIT_NroPedido(cuit, nropedido);
            PedidoTraerEstadoActual(unPedido);
            return unPedido;
        }

        public PedidoEntidad PedidoSelectByCUIT_NroPedido(Int64 nropedido)
        {
            PedidoEntidad unPedido = new PedidoEntidad();
            unPedido = GestorPedido.SelectByCUIT_NroPedido(Helpers.ConfigSection.Default.Site.Cuit, nropedido);
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

            unPedido.misDetalles.ForEach(d => d.IdPedido = idPedido);
            unPedido.misDetalles.ForEach(x => PedidoDetalleDAL.Insert(x));

            SucursalCore ManagerSucursal = new SucursalCore();
            ManagerSucursal.DescontarStockSucursal(unPedido.misDetalles, IdSucursal);
           
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


        
        //Si esta en Pendiente y pasa a Pago (llamada por estado==Pendiente)
        public void AvanzarPaso(PedidoEntidad elPedido, SucursalEntidad laSucursal, UsuarioEntidad elCliente)
        {
            ComprobanteEntidad unComprobante = new ComprobanteEntidad();//
            unComprobante.Detalles = new List<ComprobanteDetalleEntidad>();//
            ComprobanteCore unManagerComprobante = new ComprobanteCore();//
            int ContadorDetalle = 0;//

            string NroCompSolo = "";
            int NroComp;
            if (unManagerComprobante.FindAll().Count == 0)
                NroCompSolo = "0";
            //Toma el nro de comprobante y lo desglosa para formar el nuevo nro de comprobante
            if (NroCompSolo != "0")
            {
                NroComp = unManagerComprobante.FindAll().LastOrDefault().NroComprobante;
                var NroCompString = NroComp.ToString();
                NroCompSolo = NroCompString;
                //NroCompSolo = NroCompString.Remove(0, 2);
            }
            NroComp = int.Parse(NroCompSolo) + 1;
            // unComprobante.NroComprobante = int.Parse(logueado.IdCondicionFiscal.ToString() + sucursalId.ToString() + NroComp.ToString());
            unComprobante.NroComprobante = NroComp;
            unComprobante.IdSucursal = laSucursal.IdSucursal;
            if (elCliente.IdCondicionFiscal == 1)
                unComprobante.IdTipoComprobante = 2;//Factura B
            else if (elCliente.IdCondicionFiscal == 2)
                unComprobante.IdTipoComprobante = 1; //Factura A

            unComprobante.FechaComprobante = DateTime.Now;
            unComprobante.IdPedido = elPedido.IdPedido;

            foreach (var item in elPedido.misDetalles)
            {
                ComprobanteDetalleEntidad unDetalleComprobante = new ComprobanteDetalleEntidad();
                ContadorDetalle = ContadorDetalle + 1;
                unDetalleComprobante.IdComprobanteDetalle = ContadorDetalle;
                unDetalleComprobante.NroComprobante = unComprobante.NroComprobante;
                unDetalleComprobante.IdSucursal = unComprobante.IdSucursal;
                unDetalleComprobante.IdTipoComprobante = unComprobante.IdTipoComprobante;
                unDetalleComprobante.CUIT = ConfigSection.Default.Site.Cuit;
                unDetalleComprobante.IdProducto = item.miProducto.IdProducto;
                unDetalleComprobante.CantidadProducto = item.Cantidad;
                unDetalleComprobante.PrecioUnitarioFact = item.PrecioUnitario;

                unComprobante.Detalles.Add(unDetalleComprobante);
            }

            //Cambiar Estado del Pedido en memoria a Pago
            elPedido.Avanzar(false, elPedido.miFormaEntrega.IdFormaEntrega);
            PedidoSetearEstadoDescripEnMemoria(elPedido);

            //Generar factura
            unManagerComprobante.Create(unComprobante);

            //Insertar nuevo estado en BD
            _pedidoEstadoPedidoDal.Insert(new PedidoEstadoPedidoEntidad()
            {
                Fecha = DateTime.Now,
                IdEstadoPedido = elPedido.VerEstadoActual().IdEstadoPedido,
                IdPedido = elPedido.IdPedido
            });
        }


        //Si estaba en pago y pasó a EnCamino (llamada por estado==Pago)
        public void AvanzarPaso(PedidoEntidad elPedido, string elNroTracking)
        {
            //Cambiar Estado del Pedido en memoria a EnCamino
            elPedido.Avanzar(false, elPedido.miFormaEntrega.IdFormaEntrega);
            PedidoSetearEstadoDescripEnMemoria(elPedido);

            //Actualizar Nro de Tracking del pedido
            GestorPedido.PedidoActualizarNroTracking(elPedido.IdPedido, elNroTracking);

            //Insertar nuevo estado
            _pedidoEstadoPedidoDal.Insert(new PedidoEstadoPedidoEntidad()
            {
                Fecha = DateTime.Now,
                IdEstadoPedido = elPedido.VerEstadoActual().IdEstadoPedido,
                IdPedido = elPedido.IdPedido
            });
        }

        //Si estaba en pago y pasó a ListoRetirar (llamada por estado==Pago)
        //TMB es para cuando estaba en EnCamino o ListoRetirar y pasa e Entregado (llamada por EnCamino y/o ListoRetirar)
        public void AvanzarPaso(PedidoEntidad elPedido)
        {
            //Cambiar Estado del Pedido en memoria a ListoRetirar/Entregado segun corresponda
            elPedido.Avanzar(false, elPedido.miFormaEntrega.IdFormaEntrega);
            PedidoSetearEstadoDescripEnMemoria(elPedido);

            //Insertar nuevo estado
            _pedidoEstadoPedidoDal.Insert(new PedidoEstadoPedidoEntidad()
            {
                Fecha = DateTime.Now,
                IdEstadoPedido = elPedido.VerEstadoActual().IdEstadoPedido,
                IdPedido = elPedido.IdPedido
            });
        }

        public void CancelarPedido(PedidoEntidad elPedido)
        {
            //Cambiar Estado del Pedido en memoria a ListoRetirar/Entregado segun corresponda
            elPedido.Avanzar(true, elPedido.miFormaEntrega.IdFormaEntrega);
            PedidoSetearEstadoDescripEnMemoria(elPedido);

            //Devolución del stock

            //Nota de crédido en caso de estar en estado > a Pendiente de Pago

            //Insertar nuevo estado
            _pedidoEstadoPedidoDal.Insert(new PedidoEstadoPedidoEntidad()
            {
                Fecha = DateTime.Now,
                IdEstadoPedido = elPedido.VerEstadoActual().IdEstadoPedido,
                IdPedido = elPedido.IdPedido
            });
        }



        public void PedidoActualizarNroTracking(PedidoEntidad elPedido, string elNroTracking)
        {
            //Actualizar Nro de Tracking del pedido
            GestorPedido.PedidoActualizarNroTracking(elPedido.IdPedido, elNroTracking);
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



        public bool PagarPedido(string elNroTarjeta, int elCodSeg, decimal elMonto)
        {
            using (SWTarjeta.ServicioPagoClient unServicioPago = new SWTarjeta.ServicioPagoClient())
            {
                return unServicioPago.ProcesarPago(elNroTarjeta, elMonto);
            }
            
        }



    }
}