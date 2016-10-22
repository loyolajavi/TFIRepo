using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.HelperDAL;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE
{
    class Class1
    {
        public List<UsuarioEntidad> TraerTodos() { 
        
            UsuarioDAL GestorUsuario = new UsuarioDAL();
            List<UsuarioEntidad> listaPrueaba = GestorUsuario.SelectAll();
            return listaPrueaba;


        }
    }
}
