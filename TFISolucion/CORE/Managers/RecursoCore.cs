using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;



namespace TFI.CORE.Managers
{
    public class RecursoCore
    {
        private RecursoDAL _dal;

        public RecursoCore()
        {
            _dal = new RecursoDAL();
        }

        public List<RecursoEntidad> SelectAll()
        {
            return _dal.SelectAll().Where(x => x.CUIT == Helpers.ConfigSection.Default.Site.Cuit).ToList();
        }

    }
}
