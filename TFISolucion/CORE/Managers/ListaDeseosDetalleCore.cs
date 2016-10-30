﻿using System;
using System.Collections.Generic;
using TFI.DAL.DAL;
using TFI.Entidades;
using TFI.CORE.Helpers;

namespace TFI.CORE.Managers
{
    public class ListaDeseosDetalleCore
    {


        private ListaDeseosDetalleDAL unaListaDeseosDetalleDAL = new ListaDeseosDetalleDAL();

        public void ListaDeseosDetalleInsert(List<ListaDeseosDetalleEntidad> listaDeseosDetalles)
        {
            foreach (var detalle in listaDeseosDetalles)
            {
                unaListaDeseosDetalleDAL.Insert(detalle);    
            }
            
        }

    }
}
