using System.Collections.Generic;
using System.Linq;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class LenguajeCore
    {
        private LenguajeDAL _dal;
        private LenguajeControlDAL _dalControl;

        #region Constructor

        public LenguajeCore()
        {
            _dal = new LenguajeDAL();
            _dalControl = new LenguajeControlDAL();
        }

        #endregion Constructor

        public LenguajeEntidad Find(int id)
        {
            return _dal.Select(id);
        }

        public List<LenguajeEntidad> FindAll()
        {
            return _dal.SelectAll();
        }

        public LenguajeControlEntidad FindControl(int lenguajeID, string control)
        {
            return _dalControl.Select(control, lenguajeID);
        }

        public List<LenguajeControlEntidad> FindControlAll()
        {
            return _dalControl.SelectAll();
        }

        public List<LenguajeControlEntidad> FindControlsByLenguaje(int id)
        {
            return FindControlAll().Where(x => x.IdLenguaje == id).ToList();
        }
    }
}