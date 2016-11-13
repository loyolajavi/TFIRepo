using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class NDCliente : System.Web.UI.Page
    {

        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<ComprobanteEntidad> NDs = new List<ComprobanteEntidad>();
        ComprobanteCore ComprobanteBLL = new ComprobanteCore();
        List<NDsDTO> NotasDeDebitoAMostrar = new List<NDsDTO>();
        PedidoCore pedidoCore = new PedidoCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrilladeNd();
        }

        private void CargarGrilladeNd()
        {
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            foreach (var pedido in Pedidos)
            {

                var Comprobantes = ComprobanteBLL.ComprobanteSelectByIdPedido(pedido.IdPedido);
                foreach (var comprobante in Comprobantes)
                {
                    if (comprobante.IdTipoComprobante == 6 || comprobante.IdTipoComprobante == 9 || comprobante.IdComprobante == 10)
                    {
                        NDs.Add(comprobante);
                    }
                }


            }

            if (NDs.Count == 0)
            {
                sinnd.InnerHtml = "<strong>Usted no tiene facturas disponibles para consultar. Compre ahora en </strong><a href='http://startbootstrap.com/template-overviews/sb-admin-2' class='alert-link'>nuestra tienda</a>";
            }
            else
            {
                sinnd.Visible = false;
            }

            for (int i = 0; i < NDs.Count; i++)
            {
                NDsDTO NDAMostrar = new NDsDTO();
                NDAMostrar.NroComprobante = NDs[i].NroComprobante;
                NDAMostrar.FechaComprobante = NDs[i].FechaComprobante;
                NDAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(NDs[i].IdTipoComprobante).DescripTipoComprobante;

                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(NDs[i].NroComprobante, NDs[i].IdTipoComprobante);
                NDAMostrar.Total = MontoTotalPorND(Detalles);
                NotasDeDebitoAMostrar.Add(NDAMostrar);

            }

            grilladend.DataSource = NotasDeDebitoAMostrar;
            grilladend.AutoGenerateColumns = false;
            grilladend.DataBind();
        }

        private double MontoTotalPorND(List<ComprobanteDetalleEntidad> Detalles)
        {
            double montoTotal = 0;
            foreach (var unDetalle in Detalles)
                montoTotal += Convert.ToDouble(unDetalle.PrecioUnitarioFact * unDetalle.CantidadProducto);
            return montoTotal;
        }

        public class NDsDTO
        {
            public int NroComprobante { get; set; }
            public DateTime FechaComprobante { get; set; }
            public string TipoComprobante { get; set; }
            public double Total { get; set; }
        }

        protected void grilladend_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("VerDetalle"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladend.DataKeys[index].Value.ToString();
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(code));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdTipoComprobante);
                grilladedetallesdend.DataSource = ListadeDetalles;
                grilladedetallesdend.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#currentdetail').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }

        }
    }
}