using System.Collections.Generic;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class ComprobanteCore
    {
        private ComprobanteDAL _dal;

        public ComprobanteCore()
        {
            _dal = new ComprobanteDAL();
        }

        public void Create(ComprobanteEntidad e)
        {
            _dal.Insert(e);
        }

        public ComprobanteEntidad Find(int id, int sucursalId, int comprobanteTipoId)
        {
            return _dal.Select(id, sucursalId, comprobanteTipoId, Helpers.ConfigSection.Default.Site.Cuit);
        }

        public List<ComprobanteEntidad> FindAll()
        {
            return _dal.SelectAllByCUIT(Helpers.ConfigSection.Default.Site.Cuit);
        }
    }
}