﻿using System.Collections.Generic;
using TFI.DAL.DAL;
using TFI.Entidades;
using System.Linq;

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
            _dal.Insert(e);
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

        public List<ComprobanteDetalleEntidad> DetallesSelectByComprobante(int nrocomprobante,int idtipocomprobante)
        {
            return _dalDetalleComprobante.SelectAllByNroComprobante_IdSucursal_IdTipoComprobante_CUIT(nrocomprobante, 1, idtipocomprobante, Helpers.ConfigSection.Default.Site.Cuit);
        }

        public List<ComprobanteEntidad> ComprobanteSelectByIdPedido(int idpedido)
        {

            return _dal.SelectAllByIdPedido(idpedido);
        }

        public ComprobanteEntidad ComprobanteSelectAllByCUIT_NroComprobante(int nrocomprobante)
        {
            return _dal.ComprobanteSelectAllByCUIT_NroComprobante(Helpers.ConfigSection.Default.Site.Cuit, nrocomprobante)[0];
        }
       
    }
}