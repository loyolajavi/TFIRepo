using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.CORE.Helpers;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class CondicionFiscalCore
    {

        private CondicionFiscalDAL unaDALCondicionFiscal;


        public CondicionFiscalCore()
        {
            unaDALCondicionFiscal = new CondicionFiscalDAL();
        }


        public List<CondicionFiscalEntidad> CondicionFiscalSelectAll()
        {
            return unaDALCondicionFiscal.SelectAll();
        }


    }
}
