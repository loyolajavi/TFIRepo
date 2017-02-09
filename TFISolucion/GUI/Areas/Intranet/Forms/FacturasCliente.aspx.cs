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
    public partial class FacturasCliente : System.Web.UI.Page
    {
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<ComprobanteEntidad> Facturas = new List<ComprobanteEntidad>();
        ComprobanteCore ComprobanteBLL = new ComprobanteCore();
        List<FacturasDTO> FacturasAMostrar = new List<FacturasDTO>();
        PedidoCore pedidoCore = new PedidoCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null || this.Master.Autenticacion() <= FamiliaEntidad.PermisoFamilia.Cliente)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }

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
                contenedorsinfacturas.Visible = false;
            }

            for (int i = 0; i < Facturas.Count; i++)
            {
                FacturasDTO FacturaAMostrar = new FacturasDTO();
                FacturaAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(Facturas[i].IdTipoComprobante).DescripTipoComprobante;
                char TipoFacturaLetra = FacturaAMostrar.TipoComprobante[FacturaAMostrar.TipoComprobante.Length - 1];
                string Sucursal4caracteres = "";
                Sucursal4caracteres = Facturas[i].IdSucursal.ToString("D4");
                string NumeroFactura8Caracteres = "";
                NumeroFactura8Caracteres = Facturas[i].NroComprobante.ToString("D8");
                FacturaAMostrar.NroComprobante = "FC" + TipoFacturaLetra + "-" + Sucursal4caracteres + "-" + NumeroFactura8Caracteres;
                FacturaAMostrar.FechaComprobante = Facturas[i].FechaComprobante;
                

                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(Facturas[i].NroComprobante, Facturas[i].IdSucursal, Facturas[i].IdTipoComprobante);
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
            public string NroComprobante {get;set;}
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
                string ultimos8delcode = code.Substring(code.Length - 8);
                string nrocomprobantesincerosalaizquierda = ultimos8delcode.TrimStart('0');
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdSucursal, ComprobanteRow.IdTipoComprobante);
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
                string ultimos8delcode = code.Substring(code.Length - 8);
                string nrocomprobantesincerosalaizquierda = ultimos8delcode.TrimStart('0');
                var comprobantes = ComprobanteBLL.ComprobanteSelectAllListadosByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
                if (comprobantes.Any(c => c.IdTipoComprobante > 3))
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('Nota de credito ya fue generada previamente');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "ModalScript", sb.ToString(), false);
                }
                else { 
                ComprobanteEntidad ComprobanteRow = new ComprobanteEntidad();
                ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
                List<ComprobanteDetalleEntidad> ListadeDetalles = new List<ComprobanteDetalleEntidad>();
                ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdSucursal, ComprobanteRow.IdTipoComprobante);
              
                ComprobanteEntidad NotaDeCredito = new ComprobanteEntidad();

                NotaDeCredito = ComprobanteRow;

                NotaDeCredito.Detalles = new List<ComprobanteDetalleEntidad>();

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


                 int ContadorDetalle = 0;

                 foreach (var item in ListadeDetalles)
                 {

                     ComprobanteDetalleEntidad unDetalleComprobante = new ComprobanteDetalleEntidad();
                     ContadorDetalle = ContadorDetalle + 1;
                     unDetalleComprobante.IdComprobanteDetalle = ContadorDetalle;
                     unDetalleComprobante.NroComprobante = ComprobanteRow.NroComprobante;
                     unDetalleComprobante.IdSucursal = ComprobanteRow.IdSucursal;
                     unDetalleComprobante.IdTipoComprobante = NotaDeCredito.IdTipoComprobante;
                     unDetalleComprobante.CUIT = ConfigSection.Default.Site.Cuit;
                     unDetalleComprobante.IdProducto = item.IdProducto;
                     unDetalleComprobante.CantidadProducto = item.CantidadProducto;
                     unDetalleComprobante.PrecioUnitarioFact = item.PrecioUnitarioFact;
                     NotaDeCredito.Detalles.Add(unDetalleComprobante);
                     //ComprobanteDetalleEntidad NCDetalle = detalle;
                     //NCDetalle.IdTipoComprobante = NotaDeCredito.IdTipoComprobante;
                     //ComprobanteBLL.DetalleCreate(NCDetalle);
                     
                 }

                ComprobanteBLL.Create(NotaDeCredito);

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Nota de credito generada');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }
            }
        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);
            List<ComprobanteEntidad> FacturasDelCliente = new List<ComprobanteEntidad>();
            List<FacturasDTO> FacturasAMostrarDelCliente = new List<FacturasDTO>();
            foreach (var pedido in Pedidos)
            {

                if (pedido.NombreUsuario == txtClienteBusqueda.Text) { 

                var Comprobantes = ComprobanteBLL.ComprobanteSelectByIdPedido(pedido.IdPedido);
                foreach (var comprobante in Comprobantes)
                {
                    if (comprobante.IdTipoComprobante == 1 || comprobante.IdTipoComprobante == 2 || comprobante.IdComprobante == 3)
                    {
                        FacturasDelCliente.Add(comprobante);
                    }
                }

                }
            }

            if (FacturasDelCliente.Count == 0)
            {
                contenedorsinfacturas.Visible = true;
                sinfacturas.InnerHtml = "<p>Este usuario no tiene facturas disponibles para consultar.</p>";
            }
            else
            {
                 contenedorsinfacturas.Visible = false;
            }

            for (int i = 0; i < FacturasDelCliente.Count; i++)
            {
                FacturasDTO FacturaAMostrar = new FacturasDTO();
                FacturaAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(Facturas[i].IdTipoComprobante).DescripTipoComprobante;
                char TipoFacturaLetra = FacturaAMostrar.TipoComprobante[FacturaAMostrar.TipoComprobante.Length - 1];
                string Sucursal4caracteres = "";
                Sucursal4caracteres = Facturas[i].IdSucursal.ToString("D4");
                string NumeroFactura8Caracteres = "";
                NumeroFactura8Caracteres = Facturas[i].NroComprobante.ToString("D8");
                FacturaAMostrar.NroComprobante = "FC" + TipoFacturaLetra + "-" + Sucursal4caracteres + "-" + NumeroFactura8Caracteres;
                FacturaAMostrar.FechaComprobante = Facturas[i].FechaComprobante;


                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(Facturas[i].NroComprobante, Facturas[i].IdSucursal, Facturas[i].IdTipoComprobante);
                FacturaAMostrar.Total = MontoTotalPorFactura(Detalles);
                FacturasAMostrarDelCliente.Add(FacturaAMostrar);

            }

            grilladefacturas.DataSource = FacturasAMostrarDelCliente;
            grilladefacturas.AutoGenerateColumns = false;
            grilladefacturas.DataBind();

        }

    }
}