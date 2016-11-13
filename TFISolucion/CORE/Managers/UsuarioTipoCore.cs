using System;
using System.Collections.Generic;
using System.Text;
using TFI.DAL.DAL;
using TFI.CORE.Helpers;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
    public class UsuarioTipoCore
    {

        private UsuarioTipoDAL unaDALUsuariotipoCore;


        public UsuarioTipoCore()
        {
            unaDALUsuariotipoCore = new UsuarioTipoDAL();
        }


        public List<UsuarioTipoEntidad> UsuarioTipoSelectAll()
        {
            return unaDALUsuariotipoCore.SelectAll();
        }

    }
}
