using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;


namespace TFI.GUI
{
    public partial class UltimosPedidos : BasePage
    {

        private UsuarioCore UsuarioBLL = new UsuarioCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        List<PedidoEntidad> PedidosEntidad = new List<PedidoEntidad>();
        List<PedidoDetalleEntidad> PedidosDetalle = new List<PedidoDetalleEntidad>();
        private PedidoCore pedidoCore = new PedidoCore();
        private DireccionCore DireccionCore = new DireccionCore();
        List<PedidoDTO> PedidosaMostrar = new List<PedidoDTO>();
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

        public UltimosPedidos()
        {
            idioma = new LenguajeEntidad();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            if (usuarioentidad == null)
            {
                Response.Redirect("Home.aspx");
            }
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
            CargarGrillaUltimosPedidos();
        }

        private void CargarGrillaUltimosPedidos()
        {

            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            PedidosEntidad = pedidoCore.SelectAllByCUIT_NombreUsuario(usuarioentidad.CUIT, usuarioentidad.NombreUsuario);

            if (PedidosEntidad.Count == 0)
            {
                sinpedidos.InnerHtml = "<strong>Usted no realizó pedidos aún. Compre ahora en </strong><a href='http://startbootstrap.com/template-overviews/sb-admin-2' class='alert-link'>nuestra tienda</a>";
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

                PedidosaMostrar.Add(PedidoAMostrar);

            }

            grilladeultimospedidos.DataSource = PedidosaMostrar;
            grilladeultimospedidos.AutoGenerateColumns = false;
            grilladeultimospedidos.DataBind();
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

            List<PedidoDetalleEntidad> Detalles = new List<PedidoDetalleEntidad>();



        }

        public class DetalleDTO
        {
            public string Producto { get; set; }
            public int Cantidad { get; set; }
            public decimal PrecioUnitario { get; set; }
            public decimal Total { get; set; }
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
        }

    }
}