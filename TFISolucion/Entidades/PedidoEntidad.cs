using System;
using System.Collections.Generic;

namespace TFI.Entidades
{
    public class PedidoEntidad
    {
        public int IdPedido { get; set; }
        public DateTime FechaPedido { get; set; }
        public DateTime? FechaFinPedido { get; set; }
        public string NombreUsuario { get; set; }
        public int? PlazoEntrega { get; set; }
        public int IdFormaEntrega { get; set; }
        public string CUIT { get; set; }
        public string NumeroTracking { get; set; }
        public int DireccionEntrega { get; set; }
        public DateTime? FecBaja { get; set; }
        public Int64 NroPedido { get; set; }

        public EstadoPedidoEntidad Estado { get; set; }
        public List<PedidoDetalleEntidad> Detalles { get; set; }


        #region PatronState
        private StatePedido _statePedido;

        public StatePedido EstadoPedido2
        {
            get { return _statePedido; }
            set { _statePedido = value; }
        }
        


        public PedidoEntidad()
        {
            //Toma el estado actual del pedido, para empezar pongo PendientedePago, pero hay que tomarlo de la BD
            _statePedido = StatePatron.StatePendientePago.Instanciar();
        }

        public void CambiarEstado(StatePedido elEstado)
        {
            _statePedido = elEstado;
        }

        public void HaciaPendienteDePago()
        {
            _statePedido.HaciaPendienteDePago(this);
        }

        public void HaciaPago()
        {
            _statePedido.HaciaPago(this);
        }


        public void HaciaEnCamino()
        {
            _statePedido.HaciaEnCamino(this);
        }

        public void HaciaListoParaRetirar()
        {
            _statePedido.HaciaListoParaRetirar(this);
        }

        public void HaciaCancelado()
        {
            _statePedido.HaciaCancelado(this);
        }

        public void HaciaEntregado()
        {
            _statePedido.HaciaEntregado(this);
        }


        #endregion

    }
}