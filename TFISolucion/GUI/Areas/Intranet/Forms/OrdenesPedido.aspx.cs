using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.CORE.Helpers;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class OrdenesPedido : BasePage
    {
        private UsuarioCore UsuarioBLL = new UsuarioCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<PedidoEntidad> PedidosEntidad = new List<PedidoEntidad>();
        List<PedidoDetalleEntidad> PedidosDetalle = new List<PedidoDetalleEntidad>();
        private PedidoCore pedidoCore = new PedidoCore();
        private DireccionCore DireccionCore = new DireccionCore();
        List<PedidoDTO> PedidosaMostrar = new List<PedidoDTO>();
        private List<EstadoPedidoEntidad> listaEstados = new List<EstadoPedidoEntidad>();
        private HttpContext Current = HttpContext.Current;
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
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null || this.Master.Autenticacion() <= FamiliaEntidad.PermisoFamilia.Cliente)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }


            CargarGrillaUltimosPedidos();

            if (!IsPostBack)
            {
                CargarDropdownEstados();
            }
        }

        private void CargarDropdownEstados()
        {
            if (!Page.IsPostBack)
            {

                listaEstados = pedidoCore.EstadoPedidoSelectAll();
                ddlestados.DataSource = listaEstados;
                ddlestados.DataTextField = "DescripcionEstadoPedido";
                ddlestados.DataValueField = "IdEstadoPedido";
                ddlestados.DataBind();

                ddlEstadoPedido.DataSource = listaEstados;
                ddlEstadoPedido.DataTextField = "DescripcionEstadoPedido";
                ddlEstadoPedido.DataValueField = "IdEstadoPedido";
                ddlEstadoPedido.DataBind();

            }
           
        }

        private void CargarGrillaUltimosPedidos()
        {
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

           
            PedidosEntidad = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            if (PedidosEntidad.Count == 0)
            {
                sinpedidos.InnerHtml = "<strong>No existen pedidos.</a>";
            }
            else
            {
                contenedorsinpedidos.Visible = false;
            }



            for (int i = 0; i < PedidosEntidad.Count; i++)
            {
                PedidoDTO PedidoAMostrar = new PedidoDTO();
                PedidoAMostrar.cuit = PedidosEntidad[i].CUIT;
                DireccionEntidad DireccionEntrega = DireccionCore.DireccionSelect(PedidosEntidad[i].DireccionEntrega);
                PedidoAMostrar.DireccionEntrega = DireccionEntrega.Calle + " " + DireccionEntrega.Numero + ". " + DireccionEntrega.Localidad;
                PedidoAMostrar.FechaPedido = PedidosEntidad[i].FechaPedido;
                PedidoAMostrar.IdPedido = PedidosEntidad[i].IdPedido;
                PedidoAMostrar.NombreUsuario = PedidosEntidad[i].NombreUsuario;
                PedidoAMostrar.NroPedido = PedidosEntidad[i].NroPedido;

                PedidoEstadoPedidoEntidad Estado = pedidoCore.PedidoUltimoEstadoSelect(PedidosEntidad[i].IdPedido);
                EstadoPedidoEntidad EstadoPedido = pedidoCore.EstadoPedidoSelect(Estado.IdEstadoPedido);

                PedidoAMostrar.Estado = EstadoPedido.DescripcionEstadoPedido;
                PedidosDetalle = pedidoCore.PedidosDetalleSelect(PedidosEntidad[i].IdPedido);
                PedidoAMostrar.Total = MontoTotalPorPedido(PedidosDetalle);
                PedidosaMostrar.Add(PedidoAMostrar);

            }

            grilladeultimospedidos.DataSource = PedidosaMostrar;
            grilladeultimospedidos.AutoGenerateColumns = false;
            grilladeultimospedidos.DataBind();
            //ddlEstadoPedido.DataSource = pedidoCore.EstadoPedidoSelectAll();

            //ddlEstadoPedido.DataValueField = "IdEstadoPedido";
            //ddlEstadoPedido.DataTextField = "DescripcionEstadoPedido";
            //ddlEstadoPedido.DataBind();


        }

        public class PedidoDTO
        {

            public int IdPedido { get; set; }

            /// <summary>
            /// Gets or sets the FechaPedido value.
            /// </summary>
            public DateTime FechaPedido { get; set; }

            /// <summary>
            /// Gets or sets the FechaFinPedido value.
            /// </summary>
            public DateTime? FechaFinPedido { get; set; }

            /// <summary>
            /// Gets or sets the NombreUsuario value.
            /// </summary>
            public string NombreUsuario { get; set; }

            /// <summary>
            /// Gets or sets the PlazoEntrega value.
            /// </summary>
            public int? PlazoEntrega { get; set; }

            /// <summary>
            /// Gets or sets the IdFormaEntrega value.
            /// </summary>
            public string FormaEntrega { get; set; }

            /// <summary>
            /// Gets or sets the cuit value.
            /// </summary>
            public string cuit { get; set; }

            /// <summary>
            /// Gets or sets the NumeroTracking value.
            /// </summary>
            public string NumeroTracking { get; set; }

            /// <summary>
            /// Gets or sets the DireccionEntrega value.
            /// </summary>
            public string DireccionEntrega { get; set; }

            /// <summary>
            /// Gets or sets the FecBaja value.
            /// </summary>
            public DateTime? FecBaja { get; set; }

            public Int64 NroPedido { get; set; }

            public string Estado { get; set; }

            public double Total { get; set; }

            List<PedidoDetalleEntidad> Detalles = new List<PedidoDetalleEntidad>();



        }

        public class DetalleDTO
        {
            public string Producto { get; set; }
            public int Cantidad { get; set; }
            public decimal PrecioUnitario { get; set; }
            public decimal Total { get; set; }
        }

        protected double MontoTotalPorPedido(List<PedidoDetalleEntidad> listaDetalle)
        {
            double montoTotal = 0;
            foreach (var unDetalle in listaDetalle)
                montoTotal += Convert.ToDouble(unDetalle.PrecioUnitario * unDetalle.Cantidad);
            return montoTotal;

        }

        protected void grilladeultimospedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ProductoCore coreProducto = new ProductoCore();
            if (e.CommandName.Equals("VerDetalle"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladeultimospedidos.DataKeys[index].Value.ToString();
                PedidoEntidad PedidoRow = pedidoCore.PedidoSelectByCUIT_NroPedido(usuarioentidad.CUIT, Convert.ToInt64(code));
                List<PedidoDetalleEntidad> ListadeDetalles = pedidoCore.PedidosDetalleSelect(PedidoRow.IdPedido);
                List<DetalleDTO> ListaDetallesDTO = new List<DetalleDTO>();
                foreach (var item in ListadeDetalles)
                {
                    DetalleDTO NuevoDetalle = new DetalleDTO();
                    NuevoDetalle.Producto = coreProducto.Find(item.IdProducto, 1).DescripProducto;
                    NuevoDetalle.Cantidad = item.Cantidad;
                    NuevoDetalle.PrecioUnitario = item.PrecioUnitario;
                    NuevoDetalle.Total = NuevoDetalle.Cantidad * NuevoDetalle.PrecioUnitario;

                    ListaDetallesDTO.Add(NuevoDetalle);
                }

                grilladedetallesdelpedido.DataSource = ListaDetallesDTO;
                grilladedetallesdelpedido.DataBind(); 
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#currentdetail').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);

            }

            if (e.CommandName.Equals("CambiarEstado"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string code = grilladeultimospedidos.DataKeys[index].Value.ToString();
                PedidoEntidad PedidoRow = pedidoCore.PedidoSelectByCUIT_NroPedido(usuarioentidad.CUIT, Convert.ToInt64(code));
                PedidoEstadoPedidoEntidad PedidoEstadoRow = pedidoCore.PedidoUltimoEstadoSelect(Convert.ToInt32(code));
                idpedido.Value =  PedidoRow.IdPedido.ToString();
                if (PedidoEstadoRow.IdEstadoPedido == 6)
                {

                    notificationestado.InnerHtml = "No puede modificarle el estado a un pedido finalizado.";
                    ddlEstadoPedido.Visible = false;
                    btnCambiarEstado.Visible = false;

                }

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#currentestado').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "ModalScript", sb.ToString(), false);
                

            }
        }

        protected void grilladeultimospedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grilladedetallesdelpedido.PageIndex = e.NewPageIndex;
            CargarGrillaUltimosPedidos();
        }

        protected void ModificarEstado_Click(object sender, EventArgs e)
        {
            CargarGrillaUltimosPedidos();
            Response.Redirect(Request.RawUrl);
        }

        [WebMethod]
        public static List<String> ObtenerClientes()
        {
            var core = new PedidoCore();
            var usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            var pedidos = core.SelectAllByCUIT(usuarioentidad.CUIT);
            
            /*para evitar duplicados*/
            var result = pedidos.GroupBy(test => test.NombreUsuario)
                   .Select(grp => grp.First())
                   .ToList();
            // return pedidos.Select(x => x.NombreUsuario).ToList();
            return result.Select(x => x.NombreUsuario).ToList();
        }

        protected void btnCambiarEstado_Click(object sender, EventArgs e)
        {
            CargarGrillaUltimosPedidos();
            Response.Redirect(Request.RawUrl);
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void CambiarEstado(int pedido,string estado)
        {
            PedidoCore pedidoCore = new PedidoCore();
            PedidoEstadoPedidoEntidad EstadoActualizado = new PedidoEstadoPedidoEntidad();
            EstadoActualizado.IdPedido = pedido;
            EstadoActualizado.IdEstadoPedido = Convert.ToInt32(estado);
            pedidoCore.PedidoEstadoPedidoUpdate(EstadoActualizado);
        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            grilladeultimospedidos.DataSource = null;

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            List<PedidoEntidad> PedidosDeCliente = new List<PedidoEntidad>();
            List<PedidoDTO> PedidosAMostrarDelCliente = new List<PedidoDTO>();

            foreach (var pedido in Pedidos)
            {

                PedidoEstadoPedidoEntidad PedidoEstadoPedido = new PedidoEstadoPedidoEntidad();
                PedidoEstadoPedido = pedidoCore.PedidoUltimoEstadoSelect(pedido.IdPedido);
                EstadoPedidoEntidad EstadoDelPedido = new EstadoPedidoEntidad();
                EstadoDelPedido = pedidoCore.EstadoPedidoSelect(PedidoEstadoPedido.IdEstadoPedido);
                int ddlEstadoInt = Convert.ToInt32(ddlEstadoPedido.SelectedIndex + 1);
                if (pedido.NombreUsuario == txtClienteBusqueda.Text && EstadoDelPedido.DescripcionEstadoPedido == ddlEstadoPedido.SelectedItem.Text)
                {

                    PedidoDTO PedidoAMostrar = new PedidoDTO();
                    PedidoAMostrar.cuit = pedido.CUIT;
                    DireccionEntidad DireccionEntrega = DireccionCore.DireccionSelect(pedido.DireccionEntrega);
                    PedidoAMostrar.DireccionEntrega = DireccionEntrega.Calle + " " + DireccionEntrega.Numero + ". " + DireccionEntrega.Localidad;
                    PedidoAMostrar.FechaPedido = pedido.FechaPedido;
                    PedidoAMostrar.IdPedido = pedido.IdPedido;
                    PedidoAMostrar.NombreUsuario = pedido.NombreUsuario;
                    PedidoAMostrar.NroPedido = pedido.NroPedido;

                    PedidoEstadoPedidoEntidad Estado = pedidoCore.PedidoUltimoEstadoSelect(pedido.IdPedido);
                    EstadoPedidoEntidad EstadoPedido = pedidoCore.EstadoPedidoSelect(Estado.IdEstadoPedido);

                    PedidoAMostrar.Estado = EstadoPedido.DescripcionEstadoPedido;
                    PedidosDetalle = pedidoCore.PedidosDetalleSelect(pedido.IdPedido);
                    PedidoAMostrar.Total = MontoTotalPorPedido(PedidosDetalle);

                    PedidosAMostrarDelCliente.Add(PedidoAMostrar);

                }

            }

            if (PedidosAMostrarDelCliente.Count == 0)
            {
                contenedorsinpedidos.Visible = true;
                sinpedidos.InnerHtml = "<strong>No existen pedidos para este Cliente con el estado seleccionado.</a>";
            }
            else
            {
                contenedorsinpedidos.Visible = false;

                grilladeultimospedidos.DataSource = PedidosAMostrarDelCliente;
                grilladeultimospedidos.AutoGenerateColumns = false;
                grilladeultimospedidos.DataBind();
            }


        }




    }
}