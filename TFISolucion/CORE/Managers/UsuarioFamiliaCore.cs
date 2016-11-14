using System;
using System.Text;
using TFI.DAL.DAL;
using TFI.Entidades;
using System.Collections.Generic;
using TFI.CORE.Helpers;

namespace TFI.CORE.Managers
{
    public class UsuarioFamiliaCore
    {

        UsuarioFamiliaDAL unUsuarioFamiliaDAL;

        public UsuarioFamiliaCore()
        {
            unUsuarioFamiliaDAL = new UsuarioFamiliaDAL();
        }


        public void UsuarioUpdatePermisosFamilia(UsuarioFamiliaEntidad elUsuarioFamilia)
        {
            elUsuarioFamilia.CUIT = ConfigSection.Default.Site.Cuit;
            unUsuarioFamiliaDAL.UsuarioUpdatePermisosFamilia(elUsuarioFamilia);
        }


        public void UsuarioFamiliaInsert(UsuarioFamiliaEntidad elUsuarioFamilia)
        {
            elUsuarioFamilia.CUIT = ConfigSection.Default.Site.Cuit;
            unUsuarioFamiliaDAL.Insert(elUsuarioFamilia);
        }

    }
}
