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
    public partial class NCCliente : BasePage
    {
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<ComprobanteEntidad> NCs = new List<ComprobanteEntidad>();
        ComprobanteCore ComprobanteBLL = new ComprobanteCore();
        List<NCsDTO> NotasDeCreditoAMostrar = new List<NCsDTO>();
        PedidoCore pedidoCore = new PedidoCore();
        private LenguajeEntidad idioma;

        protected T FindControlFromMaster<T>(string name) where T : Control
        {
            MasterPage master = this.Master;
            while (master != null)
            {
                T control = master.FindControl(name) as T;
                if (control != null)
                    return control;

                master = master.Master;
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            if (!IsPostBack)
            {
                idioma = (LenguajeEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }
            }
            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }


            CargarGrilladeNc();
        }

        private void CargarGrilladeNc()
        {
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            string[] unosPermisosTest = new string[] { "NCredito" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
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
                    if (comprobante.miTipoComprobante.IdTipoComprobante == 5 || comprobante.miTipoComprobante.IdTipoComprobante == 6 || comprobante.miTipoComprobante.IdTipoComprobante == 7)
                    {
                        NCs.Add(comprobante);
                    }
                }


            }

            if (NCs.Count == 0)
            {
                sinnc.InnerHtml = "<strong>Usted no tiene notas de credito disponibles para consultar.</strong>";
            }
            else
            {
                contenedorsinnc.Visible = false;
            }

            for (int i = 0; i < NCs.Count; i++)
            {
                NCsDTO NCAMostrar = new NCsDTO();
              //  NCAMostrar.NroComprobante = NCs[i].NroComprobante;
                NCAMostrar.FechaComprobante = NCs[i].FechaComprobante;
                NCAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(NCs[i].miTipoComprobante.IdTipoComprobante).DescripTipoComprobante;
                char TipoNCLetra = NCAMostrar.TipoComprobante[NCAMostrar.TipoComprobante.Length - 1];
                string Sucursal4caracteres = "";
                Sucursal4caracteres = NCs[i].miSucursal.IdSucursal.ToString("D4");
                string NumeroNC8Caracteres = "";
                NumeroNC8Caracteres = NCs[i].NroComprobante.ToString("D8");
                NCAMostrar.NroComprobante = "NC" + TipoNCLetra + "-" + Sucursal4caracteres + "-" + NumeroNC8Caracteres;

                List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                Detalles = ComprobanteBLL.DetallesSelectByComprobante(NCs[i].NroComprobante, NCs[i].miSucursal.IdSucursal, NCs[i].miTipoComprobante.IdTipoComprobante);
                NCAMostrar.Total = MontoTotalPorNC(Detalles);
                NotasDeCreditoAMostrar.Add(NCAMostrar);

            }

            grilladenc.DataSource = null;
            NotasDeCreditoAMostrar = (List<NCsDTO>)NotasDeCreditoAMostrar.OrderByDescending(X => X.FechaComprobante).ToList();
            grilladenc.DataSource = NotasDeCreditoAMostrar;
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

        public class NCDetalleDTO
        {
            public string Producto { get; set; }
            public int Cantidad { get; set; }
            public decimal PrecioUnitario { get; set; }
            public decimal Total { get; set; }
        }

        protected void grilladenc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ProductoCore coreProducto = new ProductoCore();
            if (e.CommandName.Equals("VerDetalle"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladenc.DataKeys[index].Value.ToString();
                string ultimos8delcode = code.Substring(code.Length - 8);
                string nrocomprobantesincerosalaizquierda = ultimos8delcode.TrimStart('0');
                ComprobanteEntidad ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
                List<ComprobanteDetalleEntidad> ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.miSucursal.IdSucursal, ComprobanteRow.miTipoComprobante.IdTipoComprobante);
                List<NCDetalleDTO> ListaDetallesDTO = new List<NCDetalleDTO>();
                foreach (var item in ListadeDetalles)
                {
                    NCDetalleDTO NuevoDetalle = new NCDetalleDTO();
                    NuevoDetalle.Producto = coreProducto.Find(item.miProducto.IdProducto, 1).DescripProducto;
                    NuevoDetalle.Cantidad = item.CantidadProducto;
                    NuevoDetalle.PrecioUnitario = item.PrecioUnitarioFact;
                    NuevoDetalle.Total = NuevoDetalle.Cantidad * NuevoDetalle.PrecioUnitario;

                    ListaDetallesDTO.Add(NuevoDetalle);
                }


                grilladedetallesdenc.DataSource = ListaDetallesDTO;
                grilladedetallesdenc.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#currentdetail').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }


            //if (e.CommandName.Equals("GenerarND"))
            //{
            //    int index = Convert.ToInt32(e.CommandArgument);
            //    string code = grilladenc.DataKeys[index].Value.ToString();
            //    string ultimos8delcode = code.Substring(code.Length - 8);
            //    string nrocomprobantesincerosalaizquierda = ultimos8delcode.TrimStart('0');
            //    var comprobantes = ComprobanteBLL.ComprobanteSelectAllListadosByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
            //    if (comprobantes.Any(c => c.IdTipoComprobante == 6 || c.IdTipoComprobante > 8))
            //    {
            //        System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //        sb.Append(@"<script type='text/javascript'>");
            //        sb.Append("alert('Nota de debito ya fue generada previamente');");
            //        sb.Append(@"</script>");
            //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
            //                   "ModalScript", sb.ToString(), false);
            //    }
            //    else { 
            //        ComprobanteEntidad ComprobanteRow = new ComprobanteEntidad();
            //         ComprobanteRow = ComprobanteBLL.ComprobanteSelectAllByCUIT_NroComprobante(Convert.ToInt32(nrocomprobantesincerosalaizquierda));
            //         List<ComprobanteDetalleEntidad> ListadeDetalles = new List<ComprobanteDetalleEntidad>();
            //        ListadeDetalles = ComprobanteBLL.DetallesSelectByComprobante(ComprobanteRow.NroComprobante, ComprobanteRow.IdSucursal, ComprobanteRow.IdTipoComprobante);

            //        ComprobanteEntidad Notadedebito = new ComprobanteEntidad();
            //            Notadedebito = ComprobanteRow;
            //            Notadedebito.FechaComprobante = DateTime.Now;
            //            Notadedebito.Detalles = new List<ComprobanteDetalleEntidad>();
            //        switch (ComprobanteRow.IdTipoComprobante)
            //        {
            //            case 1:
            //                Notadedebito.IdTipoComprobante = 6;
            //                break;
            //            case 2:
            //                Notadedebito.IdTipoComprobante = 9;
            //                break;
            //            case 3:
            //                Notadedebito.IdTipoComprobante = 10;
            //                break;
            //            default:
            //                Notadedebito.IdTipoComprobante = 6;
            //                break;
            //        }


            //        int ContadorDetalle = 0;

            //        foreach (var item in ListadeDetalles)
            //        {

            //            ComprobanteDetalleEntidad unDetalleComprobante = new ComprobanteDetalleEntidad();
            //            ContadorDetalle = ContadorDetalle + 1;
            //            unDetalleComprobante.IdComprobanteDetalle = ContadorDetalle;
            //            unDetalleComprobante.NroComprobante = ComprobanteRow.NroComprobante;
            //            unDetalleComprobante.IdSucursal = ComprobanteRow.IdSucursal;
            //            unDetalleComprobante.IdTipoComprobante = Notadedebito.IdTipoComprobante;
            //            unDetalleComprobante.CUIT = ConfigSection.Default.Site.Cuit;
            //            unDetalleComprobante.IdProducto = item.IdProducto;
            //            unDetalleComprobante.CantidadProducto = item.CantidadProducto;
            //            unDetalleComprobante.PrecioUnitarioFact = item.PrecioUnitarioFact;
            //            Notadedebito.Detalles.Add(unDetalleComprobante);

            //        }

            //        ComprobanteBLL.Create(Notadedebito);


            //        System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //        sb.Append(@"<script type='text/javascript'>");
            //        sb.Append("alert('Nota de debito generada');");
            //        sb.Append(@"</script>");
            //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
            //                   "ModalScript", sb.ToString(), false);

            //    }
            //}
        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            List<ComprobanteEntidad> NCsDelCliente = new List<ComprobanteEntidad>();
            List<NCsDTO> NCsAMostrarDelCliente = new List<NCsDTO>();

            foreach (var pedido in Pedidos)
            {
                if (pedido.miUsuario.NombreUsuario == txtClienteBusqueda.Text)
                {

                    var Comprobantes = ComprobanteBLL.ComprobanteSelectByIdPedido(pedido.IdPedido);
                    foreach (var comprobante in Comprobantes)
                    {
                        if (comprobante.miTipoComprobante.IdTipoComprobante == 5 || comprobante.miTipoComprobante.IdTipoComprobante == 6 || comprobante.miTipoComprobante.IdTipoComprobante == 7)
                        {
                            NCsDelCliente.Add(comprobante);
                        }
                    }
                }

                }

                if (NCsDelCliente.Count == 0)
                {
                    contenedorsinnc.Visible = true;
                    sinnc.InnerHtml = "<strong>Este cliente no tiene notas de credito disponibles para consultar.</strong>";
                }
                else
                {
                    contenedorsinnc.Visible = false;
                }

                for (int i = 0; i < NCsDelCliente.Count; i++)
                {
                    NCsDTO NCAMostrar = new NCsDTO();
                    //  NCAMostrar.NroComprobante = NCs[i].NroComprobante;
                    NCAMostrar.FechaComprobante = NCs[i].FechaComprobante;
                    NCAMostrar.TipoComprobante = ComprobanteBLL.TipoComprobanteSelectById(NCs[i].miTipoComprobante.IdTipoComprobante).DescripTipoComprobante;
                    char TipoNCLetra = NCAMostrar.TipoComprobante[NCAMostrar.TipoComprobante.Length - 1];
                    string Sucursal4caracteres = "";
                    Sucursal4caracteres = NCs[i].miSucursal.IdSucursal.ToString("D4");
                    string NumeroNC8Caracteres = "";
                    NumeroNC8Caracteres = NCs[i].NroComprobante.ToString("D8");
                    NCAMostrar.NroComprobante = "NC" + TipoNCLetra + "-" + Sucursal4caracteres + "-" + NumeroNC8Caracteres;

                    List<ComprobanteDetalleEntidad> Detalles = new List<ComprobanteDetalleEntidad>();

                    Detalles = ComprobanteBLL.DetallesSelectByComprobante(NCs[i].NroComprobante, NCs[i].miSucursal.IdSucursal, NCs[i].miTipoComprobante.IdTipoComprobante);
                    NCAMostrar.Total = MontoTotalPorNC(Detalles);
                    NCsAMostrarDelCliente.Add(NCAMostrar);

                }

                grilladenc.DataSource = NCsAMostrarDelCliente;
                grilladenc.AutoGenerateColumns = false;
                grilladenc.DataBind();

            }

        protected void grilladenc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grilladenc.PageIndex = e.NewPageIndex;
            CargarGrilladeNc();
        }
        }
    }
