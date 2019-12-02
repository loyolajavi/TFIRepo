using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
   public class StockCore
    {
        private StockSucursalDAL DalStock = new StockSucursalDAL();

        public void Insert(StockSucursalEntidad stock)
        {
            DalStock.Insert(stock);
        }

        public List<StockSucursalEntidad> SelectByIdProducto(int idproducto)
        {
            try
            {
                return DalStock.SelectAllByIdProducto(idproducto);
            }
            catch (Exception)
            {
                throw;
            } 
            
           
        }

        public void Update(StockSucursalEntidad stock)
        {
            DalStock.Update(stock);
        }
    }
}
