using System;
using System.Collections.Generic;
using TFI.DAL.DAL;
using TFI.Entidades;
using TFI.CORE.Helpers;

namespace TFI.CORE.Managers
{
    public class ListaDeseosCore
    {

        private ListaDeseoDAL unaListaDeseosDAL = new ListaDeseoDAL();

        public List<ListaDeseoEntidad> ListaDeseosSelectAllByCUIT_NombreUsuario(string nombreUsuario)
        {

            return unaListaDeseosDAL.SelectAllByCUIT_NombreUsuario(ConfigSection.Default.Site.Cuit, nombreUsuario);
            
        }


        public int ListaDeseosInsert(ListaDeseoEntidad listaDeseo)
        {
            return unaListaDeseosDAL.Insert(listaDeseo);
            
        }


    }
}
