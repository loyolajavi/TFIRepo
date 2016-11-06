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


        public int ListaDeseosInsert(ListaDeseoEntidad laListaDeseo)
        {
            if (unaListaDeseosDAL.Select(laListaDeseo).IdProducto == 0)
            {
                unaListaDeseosDAL.Insert(laListaDeseo);
                return 1; //Así se si se inserto algo o no
            }
            return 0;
        }

        public void ListaDeseosDelete(ListaDeseoEntidad elDeseo)
        {
            elDeseo.CUIT = ConfigSection.Default.Site.Cuit;
            unaListaDeseosDAL.Delete(elDeseo);
        }


    }
}
