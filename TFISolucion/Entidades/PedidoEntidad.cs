using System;
using System.Collections.Generic;

namespace TFI.Entidades
{
    [Serializable]
    public class PedidoEntidad
    {
        public int IdPedido { get; set; }
        public DateTime FechaPedido { get; set; }
        public DateTime? FechaFinPedido { get; set; }
        public FormaEntregaEntidad miFormaEntrega { get; set; }
        public string NumeroTracking { get; set; }
        public DireccionEntidad miDireccionEntrega { get; set; }
        public DateTime? FecBaja { get; set; }
        public Int64 NroPedido { get; set; }
        public UsuarioEntidad miUsuario { get; set; }
        public List<PedidoDetalleEntidad> misDetalles { get; set; }
        public List<ComprobanteEntidad> misComprobantes { get; set; }

        public List<PagoEntidad> misPagos { get; set; }
        #region PatronState
        public StatePedido EstadoActual;

        public StatePedido VerEstadoActual()
        {
            return EstadoActual;
        }

        public void DefinirEstado(StatePedido elEstado)
        {
            EstadoActual = elEstado;
        }

        public void Avanzar(bool Cancela, int laFormaEnvio)
        {
            EstadoActual.SiguientePaso(this, Cancela, laFormaEnvio);
        }

        //public StatePedido EstadoPedido2
        //{
        //    get { return _statePedido; }
        //    set { _statePedido = value; }
        //}
        


        //public PedidoEntidad()
        //{
        //    //Toma el estado actual del pedido, para empezar pongo PendientedePago, pero hay que tomarlo de la BD
        //    _statePedido = StatePatron.StatePendientePago.Instanciar();
        //}

        //public void CambiarEstado(StatePedido elEstado)
        //{
        //    _statePedido = elEstado;
        //}

        //public void HaciaPendienteDePago()
        //{
        //    _statePedido.HaciaPendienteDePago(this);
        //}

        //public void HaciaPago()
        //{
        //    _statePedido.HaciaPago(this);
        //}


        //public void HaciaEnCamino()
        //{
        //    _statePedido.HaciaEnCamino(this);
        //}

        //public void HaciaListoParaRetirar()
        //{
        //    _statePedido.HaciaListoParaRetirar(this);
        //}

        //public void HaciaCancelado()
        //{
        //    _statePedido.HaciaCancelado(this);
        //}

        //public void HaciaEntregado()
        //{
        //    _statePedido.HaciaEntregado(this);
        //}


        #endregion

    }
}