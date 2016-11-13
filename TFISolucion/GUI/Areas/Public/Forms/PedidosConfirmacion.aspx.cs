using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.GUI.Helpers.DTO;

namespace TFI.GUI.Areas.Public.Forms
{
    public partial class PedidosConfirmacion : System.Web.UI.Page
    {
        public UsuarioEntidad logueado;
        public List<PedidoLista> lista;
        public decimal totalizado;
        public int? FormaEntrega;


        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            if (logueado == null)
                Response.Redirect("Pedidos.aspx");

            lista = (List<PedidoLista>)Current.Session["Pedido"];

            FormaEntrega = (int?)Current.Session["FormaEnvio"];

            totalizado = lista.Select(x => x.Cantidad * x.Producto.PrecioUnitario).Sum();
            //TODO: sacarle el precio de envio hardcodeado:
            if (FormaEntrega != null && FormaEntrega == (int)FormaEntregaEntidad.Options.Correo)
                totalizado = totalizado + 200;

        }

        [WebMethod]
        public static void GenerarPedido()
        {
            var Current = HttpContext.Current;

            var dal = new PedidoCore();
            var pedido = new PedidoEntidad() {
                
            };

            dal.Create(pedido);



        }
    }
}