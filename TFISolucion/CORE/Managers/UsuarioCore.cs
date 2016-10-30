using System;
using System.Configuration;
using TFI.DAL.DAL;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class UsuarioCore
    {
        private UsuarioDAL _dal;

        public UsuarioCore()
        {
            _dal = new UsuarioDAL();
        }

        public UsuarioEntidad loginUsuario(string clave, string nombreUsuario)
        {
            try
            {
                return _dal.SelectUserByClaveNombreUsuario(clave, nombreUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void RegistrarUsuario(UsuarioEntidad usuario)
        {
            try
            {
                usuario.CUIT = Helpers.ConfigSection.Default.Site.Cuit;
                _dal.Insert(usuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}