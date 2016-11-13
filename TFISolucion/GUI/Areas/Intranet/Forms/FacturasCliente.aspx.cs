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
    public partial class FacturasCliente : System.Web.UI.Page
    {
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<ComprobanteEntidad> Facturas = new List<ComprobanteEntidad>();
        ComprobanteCore ComprobanteBLL = new ComprobanteCore();
        List<FacturasDTO> FacturasAMostrar = new List<FacturasDTO>();
        PedidoCore pedidoCore = new PedidoCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrillaDeFacturas();
        }

        private void CargarGrillaDeFacturas()
        {
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

           foreach (var pedido in Pedidos)
           {

               var Comprobantes = ComprobanteBLL.ComprobanteSelectByIdPedido(pedido.IdPedido);
               foreach (var comprobante in Comprobantes)
               {
                   if (comprobante.IdTipoComprobante == 1 || comprobante.IdTipoComprobante == 2 || comprobante.IdComprobante == 3)
                   {
                       Facturas.Add(comprobante);
                   }
               }
              

           }

            if (Facturas.Count == 0)
            {
                sinfacturas.InnerHtml = "<strong>Usted no tiene facturas disponibles para consultar. Compre ahora en </strong><a href='http://startbootstrap.com/template-overviews/sb-admin-2' class='alert-link'>nuestra tienda</a>";
            }
            else
            {
                sinfacturas.Visible = false;
            }

            for (int i = 0; i < Facturas.Count; i++)
            {
                FacturasDTO FacturaAMostrar = new FacturasDTO();
                FacturaAMostrar.NroComprobante = Facturas[i].NroComprobante;
                FacturaAMostrar.FechaComprobante = Facturas[i].FechaComprobante;
                FacturaAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(Facturas[i].IdTipoComprobante).DescripTipoComprobante;

                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(Facturas[i].NroComprobante, Facturas[i].IdTipoComprobante);
                FacturaAMostrar.Total = MontoTotalPorFactura(Detalles);
                FacturasAMostrar.Add(FacturaAMostrar);

            }

            grilladefacturas.DataSource = FacturasAMostrar;
            grilladefacturas.AutoGenerateColumns = false;
            grilladefacturas.DataBind();

        }

        private double MontoTotalPorFactura(List<ComprobanteDetalleEntidad> Detalles)
        {
            double montoTotal = 0;
            foreach (var unDetalle in Detalles)
                montoTotal += Convert.ToDouble(unDetalle.PrecioUnitarioFact * unDetalle.CantidadProducto);
            return montoTotal;
        }

        public class FacturasDTO
        {
          public  int NroComprobante {get;set;}
            public DateTime FechaComprobante {get;set;}
            public string TipoComprobante {get;set;}
            public double Total {get;set;}
        }

        protected void grilladefacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("VerDetalle"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladefacturas.DataKeys[index].Value.ToString();
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(code));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdTipoComprobante);
                grilladedetallesdefactura.DataSource = ListadeDetalles;
                grilladedetallesdefactura.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#currentdetail').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }


            if (e.CommandName.Equals("GenerarNC"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladefacturas.DataKeys[index].Value.ToString();
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(code));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdTipoComprobante);

                ComprobanteEntidad NotaDeCredito = ComprobanteRow;
                 switch (ComprobanteRow.IdTipoComprobante)
                  {
                case 1:
                    NotaDeCredito.IdTipoComprobante = 5;
                    break;
                case 2:
                    NotaDeCredito.IdTipoComprobante = 7;
                    break;
                case 3:
                    NotaDeCredito.IdTipoComprobante = 8;
                    break;
                default:
                     NotaDeCredito.IdTipoComprobante = 5;
                    break;
                 }

                 ComprobanteBLL.Create(NotaDeCredito);

                 foreach (var detalle in ListadeDetalles)
                 {
                     ComprobanteDetalleEntidad NCDetalle = detalle;
                     NCDetalle.IdTipoComprobante = NotaDeCredito.IdTipoComprobante;
                     ComprobanteBLL.DetalleCreate(NCDetalle);
                     
                 }


                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Nota de credito generada');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }
        }

    }
}