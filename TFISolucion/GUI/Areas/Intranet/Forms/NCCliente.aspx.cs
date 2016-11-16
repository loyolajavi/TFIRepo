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
    public partial class NCCliente : System.Web.UI.Page
    {
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<ComprobanteEntidad> NCs = new List<ComprobanteEntidad>();
        ComprobanteCore ComprobanteBLL = new ComprobanteCore();
        List<NCsDTO> NotasDeCreditoAMostrar = new List<NCsDTO>();
        PedidoCore pedidoCore = new PedidoCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrilladeNc();
        }

        private void CargarGrilladeNc()
        {
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null || this.Master.Autenticacion() <= FamiliaEntidad.PermisoFamilia.Cliente)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            foreach (var pedido in Pedidos)
            {

                var Comprobantes = ComprobanteBLL.ComprobanteSelectByIdPedido(pedido.IdPedido);
                foreach (var comprobante in Comprobantes)
                {
                    if (comprobante.IdTipoComprobante == 5 || comprobante.IdTipoComprobante == 7 || comprobante.IdComprobante == 8)
                    {
                        NCs.Add(comprobante);
                    }
                }


            }

            if (NCs.Count == 0)
            {
                sinnc.InnerHtml = "<strong>Usted no tiene facturas disponibles para consultar. Compre ahora en </strong><a href='http://startbootstrap.com/template-overviews/sb-admin-2' class='alert-link'>nuestra tienda</a>";
            }
            else
            {
                sinnc.Visible = false;
            }

            for (int i = 0; i < NCs.Count; i++)
            {
                NCsDTO NCAMostrar = new NCsDTO();
                NCAMostrar.NroComprobante = NCs[i].NroComprobante;
                NCAMostrar.FechaComprobante = NCs[i].FechaComprobante;
                NCAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(NCs[i].IdTipoComprobante).DescripTipoComprobante;

                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(NCs[i].NroComprobante, NCs[i].IdTipoComprobante);
                NCAMostrar.Total = MontoTotalPorNC(Detalles);
                NotasDeCreditoAMostrar.Add(NCAMostrar);

            }

            grilladenc.DataSource = NotasDeCreditoAMostrar;
            grilladenc.AutoGenerateColumns = false;
            grilladenc.DataBind();
        }

        private double MontoTotalPorNC(List<ComprobanteDetalleEntidad> Detalles)
        {
            double montoTotal = 0;
            foreach (var unDetalle in Detalles)
                montoTotal += Convert.ToDouble(unDetalle.PrecioUnitarioFact * unDetalle.CantidadProducto);
            return montoTotal;
        }

        public class NCsDTO
        {
            public int NroComprobante { get; set; }
            public DateTime FechaComprobante { get; set; }
            public string TipoComprobante { get; set; }
            public double Total { get; set; }
        }

        protected void grilladenc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("VerDetalle"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladenc.DataKeys[index].Value.ToString();
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(code));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdTipoComprobante);
                grilladedetallesdenc.DataSource = ListadeDetalles;
                grilladedetallesdenc.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#currentdetail').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }


            if (e.CommandName.Equals("GenerarND"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladenc.DataKeys[index].Value.ToString();
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(code));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdTipoComprobante);

                ComprobanteEntidad Notadedebito = ComprobanteRow;
                switch (ComprobanteRow.IdTipoComprobante)
                {
                    case 5:
                        Notadedebito.IdTipoComprobante = 6;
                        break;
                    case 7:
                        Notadedebito.IdTipoComprobante = 9;
                        break;
                    case 8:
                        Notadedebito.IdTipoComprobante = 10;
                        break;
                    default:
                        Notadedebito.IdTipoComprobante = 6;
                        break;
                }

                ComprobanteBLL.Create(Notadedebito);

                foreach (var detalle in ListadeDetalles)
                {
                    ComprobanteDetalleEntidad NDDetalle = detalle;
                    NDDetalle.IdTipoComprobante = Notadedebito.IdTipoComprobante;
                    ComprobanteBLL.DetalleCreate(NDDetalle);

                }


                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Nota de debito generada');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }
        }
    }
}