using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Helpers;
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
              //  NCAMostrar.NroComprobante = NCs[i].NroComprobante;
                NCAMostrar.FechaComprobante = NCs[i].FechaComprobante;
                NCAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(NCs[i].IdTipoComprobante).DescripTipoComprobante;
                char TipoNCLetra = NCAMostrar.TipoComprobante[NCAMostrar.TipoComprobante.Length - 1];
                string Sucursal4caracteres = "";
                Sucursal4caracteres = NCs[i].IdSucursal.ToString("D4");
                string NumeroNC8Caracteres = "";
                NumeroNC8Caracteres = NCs[i].NroComprobante.ToString("D8");
                NCAMostrar.NroComprobante = "NC" + TipoNCLetra + "-" + Sucursal4caracteres + "-" + NumeroNC8Caracteres;

                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(NCs[i].NroComprobante, NCs[i].IdSucursal, NCs[i].IdTipoComprobante);
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
            public string NroComprobante { get; set; }
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
                string ultimos8delcode = code.Substring(code.Length - 8);
                string nrocomprobantesincerosalaizquierda = ultimos8delcode.TrimStart('0');
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdSucursal, ComprobanteRow.IdTipoComprobante);
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
                string ultimos8delcode = code.Substring(code.Length - 8);
                string nrocomprobantesincerosalaizquierda = ultimos8delcode.TrimStart('0');
                ComprobanteEntidad ComprobanteRow = new ComprobanteEntidad();
                 ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
                 List<ComprobanteDetalleEntidad> ListadeDetalles = new List<ComprobanteDetalleEntidad>();
                ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdSucursal, ComprobanteRow.IdTipoComprobante);

                ComprobanteEntidad Notadedebito = new ComprobanteEntidad();
                    Notadedebito = ComprobanteRow;
                    Notadedebito.Detalles = new List<ComprobanteDetalleEntidad>();
                switch (ComprobanteRow.IdTipoComprobante)
                {
                    case 1:
                        Notadedebito.IdTipoComprobante = 6;
                        break;
                    case 2:
                        Notadedebito.IdTipoComprobante = 9;
                        break;
                    case 3:
                        Notadedebito.IdTipoComprobante = 10;
                        break;
                    default:
                        Notadedebito.IdTipoComprobante = 6;
                        break;
                }


                int ContadorDetalle = 0;

                foreach (var item in ListadeDetalles)
                {

                    ComprobanteDetalleEntidad unDetalleComprobante = new ComprobanteDetalleEntidad();
                    ContadorDetalle = ContadorDetalle + 1;
                    unDetalleComprobante.IdComprobanteDetalle = ContadorDetalle;
                    unDetalleComprobante.NroComprobante = ComprobanteRow.NroComprobante;
                    unDetalleComprobante.IdSucursal = ComprobanteRow.IdSucursal;
                    unDetalleComprobante.IdTipoComprobante = Notadedebito.IdTipoComprobante;
                    unDetalleComprobante.CUIT = ConfigSection.Default.Site.Cuit;
                    unDetalleComprobante.IdProducto = item.IdProducto;
                    unDetalleComprobante.CantidadProducto = item.CantidadProducto;
                    unDetalleComprobante.PrecioUnitarioFact = item.PrecioUnitarioFact;
                    Notadedebito.Detalles.Add(unDetalleComprobante);

                }

                ComprobanteBLL.Create(Notadedebito);


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