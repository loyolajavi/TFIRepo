using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Helpers;
using TFI.CORE.Managers;
using TFI.Entidades;


namespace TFI.GUI
{
    public partial class UltimosPedidos : BasePage
    {

        private UsuarioCore UsuarioBLL = new UsuarioCore();
        UsuarioEntidad logueado = new UsuarioEntidad();
        List<PedidoEntidad> PedidosEntidad = new List<PedidoEntidad>();
        List<PedidoDetalleEntidad> PedidosDetalle = new List<PedidoDetalleEntidad>();
        private PedidoCore pedidoCore = new PedidoCore();
        private DireccionCore DireccionCore = new DireccionCore();
        List<PedidoDTO> PedidosaMostrar = new List<PedidoDTO>();
        private LenguajeEntidad idioma;
        private HttpContext Current = HttpContext.Current;
        public MonedaEmpresaEntidad cotizacion;
        public MonedaEntidad moneda;
        private MonedaCore _coreMoneda;

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
            cotizacion = new MonedaEmpresaEntidad();
            moneda = new MonedaEntidad();
            _coreMoneda = new MonedaCore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            logueado = (UsuarioEntidad)Current.Session["Usuario"];
            
            if (logueado == null)
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }
            if (!IsPostBack)
            {

                idioma = (LenguajeEntidad)Current.Session["Idioma"];

                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Current.Session["Idioma"] = idioma;

                }
                cotizacion = new MonedaEmpresaEntidad();
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];
                Session.Add("cotizacionAnterior", "");
                CargarGrillaUltimosPedidos();
            }
            else
            {
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Current.Session["Idioma"] = idioma;
            }
            if (cotizacion != null)
                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;

            }
            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                if (cotizacion != null)
                    lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();
            
        }

        private void CargarGrillaUltimosPedidos()
        {

            logueado = (UsuarioEntidad)Current.Session["Usuario"];

            PedidosEntidad = pedidoCore.SelectAllByCUIT_NombreUsuario(logueado.NombreUsuario);

            if (PedidosEntidad.Count == 0)
            {
                sinpedidos.InnerHtml = "<strong>Usted no realizó pedidos </strong>";
            }
            else
            {
                contenedorsinpedidos.Visible = false;
            }



            for (int i = 0; i < PedidosEntidad.Count; i++)
            {
                PedidoDTO PedidoAMostrar = new PedidoDTO();
                PedidoAMostrar.cuit = PedidosEntidad[i].miUsuario.CUIT;
                DireccionEntidad DireccionEntrega = DireccionCore.DireccionSelect(PedidosEntidad[i].miDireccionEntrega.IdDireccion);
                PedidoAMostrar.DireccionEntrega = DireccionEntrega.Calle + " " + DireccionEntrega.Numero + ". " + DireccionEntrega.Localidad;
                PedidoAMostrar.FechaPedido = PedidosEntidad[i].FechaPedido;
                PedidoAMostrar.IdPedido = PedidosEntidad[i].IdPedido;
                PedidoAMostrar.NombreUsuario = PedidosEntidad[i].miUsuario.NombreUsuario;
                PedidoAMostrar.NroPedido = PedidosEntidad[i].NroPedido;

                //PedidoEstadoPedidoEntidad Estado = pedidoCore.PedidoUltimoEstadoSelect(PedidosEntidad[i].IdPedido);
                //EstadoPedidoEntidad EstadoPedido = pedidoCore.EstadoPedidoSelect(Estado.IdEstadoPedido);

                PedidoAMostrar.Estado = PedidosEntidad[i].VerEstadoActual().DescripcionEstadoPedido;
                PedidoAMostrar.IdEstadoPedido = PedidosEntidad[i].VerEstadoActual().IdEstadoPedido;
                //PedidoAMostrar.Estado = EstadoPedido.DescripcionEstadoPedido;

                PedidosaMostrar.Add(PedidoAMostrar);

            }
            grilladeultimospedidos.DataSource = null;
            PedidosaMostrar = (List<PedidoDTO>)PedidosaMostrar.OrderByDescending(X => X.NroPedido).ToList();
            grilladeultimospedidos.DataSource = PedidosaMostrar;
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

            public int IdEstadoPedido { get; set; }
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
                PedidoEntidad PedidoRow = pedidoCore.PedidoSelectByCUIT_NroPedidoCliente(logueado.CUIT, Convert.ToInt64(code));
                List<PedidoDetalleEntidad> ListadeDetalles = pedidoCore.PedidosDetalleSelect(PedidoRow.IdPedido);
                List<DetalleDTO> ListaDetallesDTO = new List<DetalleDTO>();
                foreach (var item in ListadeDetalles)
                {
                    DetalleDTO NuevoDetalle = new DetalleDTO();
                    NuevoDetalle.Producto = coreProducto.Find(item.miProducto.IdProducto, 1).DescripProducto;
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
            //if (e.CommandName.Equals("PagarPedido"))
            //{
            //    //Obtener IdPedido seleccionado
            //    int index = Convert.ToInt32(e.CommandArgument);
            //    Int64 unNroPedido = Int64.Parse(grilladeultimospedidos.DataKeys[index].Value.ToString());
            //    //variables
            //    PedidoCore unManagerPedido = new PedidoCore();
            //    var Current = HttpContext.Current;
            //    PedidoEntidad unPedidoPagar = new PedidoEntidad();
            //    SucursalCore ManagerSucursal = new SucursalCore();

            //    //Preparar parámetros a enviar a Avanzar()
            //    logueado = (UsuarioEntidad)Current.Session["Usuario"];
            //    unPedidoPagar = unManagerPedido.PedidoSelectByCUIT_NroPedido(unNroPedido);
            //    unPedidoPagar.misDetalles = unManagerPedido.PedidosDetalleSelect(unPedidoPagar.IdPedido);
            //    SucursalEntidad unaSucursal = ManagerSucursal.SucursalTraerPorDireccionSucursal(unPedidoPagar.miDireccionEntrega.IdDireccion);

            //    TarjetaEntidad unaTarjeta = new TarjetaEntidad();
            //    TarjetaCore coreTarjeta = new TarjetaCore();
            //    List<TarjetaEntidad> MisTarjetas = coreTarjeta.SelectAllTarjetasByCUIT_NombreUsuario(ConfigSection.Default.Site.Cuit, logueado.NombreUsuario);
            //    foreach (var t in MisTarjetas)
            //    {
            //        if (t.Predeterminada == true)
            //        {
            //            unaTarjeta = t;
            //        }
            //    }

            //    if (unManagerPedido.PagarPedido(unaTarjeta.Numero.ToString(), unaTarjeta.CodSeguridad, (decimal)unPedidoPagar.misDetalles.Select(x => x.Cantidad * x.miProducto.PrecioUnitario).Sum()))
            //    {
            //        unManagerPedido.AvanzarPaso(unPedidoPagar, unaSucursal, logueado);
            //        return true;
            //    }
            //    return false;
                
            //    CargarGrillaUltimosPedidos();
            //    Response.Redirect(Request.RawUrl);
                
            //}//END Pagar
        }//END GrillaMetodos


        [WebMethod]
        public static int ObtenerComprasDrop()
        {

            //Session["Compras"] va a estar cargado desde MasterBasico en CargarComprasEnSession()
            UsuarioEntidad unUsuario = new UsuarioEntidad();
            
            

            List<PedidoEntidad> unosPedidosRealizados = new List<PedidoEntidad>();
            PedidoCore ManagerPedidos = new PedidoCore();
            if (HttpContext.Current.Session["Usuario"] != null)
            {
                unUsuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
                unosPedidosRealizados = ManagerPedidos.SelectAllByCUIT_NombreUsuario(unUsuario.NombreUsuario);
                unosPedidosRealizados.RemoveAll(X => X.VerEstadoActual().IdEstadoPedido != (int)EstadoPedidoEntidad.Options.PendientePago);
                HttpContext.Current.Session.Add("Compras", unosPedidosRealizados);
            }
                
            return unosPedidosRealizados.Count();

        }


        //Para ordenar por NroPedido
        protected void grilladeultimospedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grilladeultimospedidos.PageIndex = e.NewPageIndex;
            CargarGrillaUltimosPedidos();
        }


        //protected override void OnInit(EventArgs e)
        //{
        //    grilladeultimospedidos.RowDataBound += new GridViewRowEventHandler(grilladeultimospedidos_RowDataBound);
        //    base.OnInit(e);
        //}

        //protected void grilladeultimospedidos_RowDataBound(Object sender, GridViewRowEventArgs e)
        //{
        //    if(e.Row.RowType != DataControlRowType.DataRow) return;

        //    // Hide the edit button when some condition is true
        //    // for example, the row contains a certain property
        //    string AUX;
        //    AUX = e.Row.Cells[3].Text;
        //    //REVISAR: Que no compare el string, sino el RESOURCE O EL IDDELPEDIDO
        //    if (AUX != "Pendiente de pago")
        //    {
        //        Button btnPagar = (Button)e.Row.FindControl("btnPagarPedido");
        //        btnPagar.Visible = false;
        //    }
        //}






    }
}