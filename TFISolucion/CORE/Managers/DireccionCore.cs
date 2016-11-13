using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class DireccionCore
    {

        private DireccionDAL DalDeDireccion = new DireccionDAL();
        private DireccionUsuarioDAL DalDeDireccionUsuario = new DireccionUsuarioDAL();

        public DireccionEntidad DireccionSelect(int idDireccion)
        {
            return DalDeDireccion.Select(idDireccion);
        }

        public List< DireccionUsuarioEntidad> DireccionUsuarioSelect(int iddireccion)
        {
            return DalDeDireccionUsuario.SelectAllByIdDireccion(iddireccion);
        }

        public List<DireccionEntidad> FindAll()
        {
            return DalDeDireccion.SelectAll();
        }

    }
}
