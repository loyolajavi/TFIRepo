using System.Collections.Generic;
using TFI.DAL.DAL;
using TFI.Entidades;
using System.Linq;
using System;

namespace TFI.CORE.Managers
{
    public class ComprobanteCore
    {
        private ComprobanteDAL _dal;
        private TipoComprobanteDAL _dalTipoComprobante = new TipoComprobanteDAL();
        private ComprobanteDetalleDAL _dalDetalleComprobante = new ComprobanteDetalleDAL();

        public ComprobanteCore()
        {
            _dal = new ComprobanteDAL();
        }

        public void Create(ComprobanteEntidad e)
        {
            try
            {
                e.CUIT = Helpers.ConfigSection.Default.Site.Cuit;
                var Nro = _dal.Insert(e);
                var Resultado = Convert.ToInt32(Nro);

                foreach (ComprobanteDetalleEntidad item in e.Detalles)
                {
                    DetalleCreate(item);
                }
            }
            catch (Exception)
            {
                throw;
            }

           

        }

        public void DetalleCreate(ComprobanteDetalleEntidad e)
        {
            _dalDetalleComprobante.Insert(e);
        }

        public ComprobanteEntidad Find(int id, int sucursalId, int comprobanteTipoId)
        {
            return _dal.Select(id, sucursalId, comprobanteTipoId, Helpers.ConfigSection.Default.Site.Cuit);
        }

        public List<ComprobanteEntidad> FindAll()
        {
            return _dal.SelectAllByCUIT(Helpers.ConfigSection.Default.Site.Cuit);
        }

        public TipoComprobanteEntidad TipoComprobanteSelectById(int id)
        {
            return _dalTipoComprobante.Select(id);
        }

        public List<ComprobanteDetalleEntidad> DetallesSelectByComprobante(int nrocomprobante,int idsucursal,int idtipocomprobante)
        {
            return _dalDetalleComprobante.SelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT(nrocomprobante, idsucursal, idtipocomprobante, Helpers.ConfigSection.Default.Site.Cuit);
        }

        public List<ComprobanteEntidad> ComprobanteSelectByIdPedido(int idpedido)
        {

            return _dal.SelectAllByIdPedido(idpedido);
        }

        public ComprobanteEntidad ComprobanteSelectAllByCUIT_NroComprobante(int nrocomprobante)
        {
            return _dal.ComprobanteSelectAllByCUIT_NroComprobante(Helpers.ConfigSection.Default.Site.Cuit, nrocomprobante)[0];
        }

        public List<ComprobanteEntidad> ComprobanteSelectAllListadosByCUIT_NroComprobante(int nrocomprobante)
        {
            return _dal.ComprobanteSelectAllByCUIT_NroComprobante(Helpers.ConfigSection.Default.Site.Cuit, nrocomprobante);
        }
       
    }
}