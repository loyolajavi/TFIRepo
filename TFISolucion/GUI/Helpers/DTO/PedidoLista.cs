using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TFI.Entidades;

namespace TFI.GUI.Helpers.DTO
{
    public class PedidoLista
    {
        public ProductoEntidad Producto { get; set; }
        public int Cantidad { get; set; }
        public bool Stock { get; set; }
    }
}