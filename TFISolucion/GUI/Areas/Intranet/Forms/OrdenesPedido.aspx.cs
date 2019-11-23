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
        UsuarioEntidad logueado = new UsuarioEntidad();
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
            }
            else
            {
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Current.Session["Idioma"] = idioma;
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;
            }
            usuarioentidad = (UsuarioEntidad)Current.Session["Usuario"];

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
                //ddlestados.DataSource = listaEstados;
                //ddlestados.DataTextField = "DescripcionEstadoPedido";
                //ddlestados.DataValueField = "IdEstadoPedido";
                //ddlestados.DataBind();

                ddlEstadoPedido.DataSource = listaEstados;
                ddlEstadoPedido.DataTextField = "DescripcionEstadoPedido";
                ddlEstadoPedido.DataValueField = "IdEstadoPedido";
                ddlEstadoPedido.DataBind();

            }

        }

        private void CargarGrillaUltimosPedidos()
        {
            usuarioentidad = (UsuarioEntidad)Current.Session["Usuario"];
            PedidosaMostrar.Clear();
           
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
                DireccionEntidad DireccionEntrega = DireccionCore.DireccionSelect(PedidosEntidad[i].miDireccionEntrega.IdDireccion);
                PedidoAMostrar.DireccionEntrega = DireccionEntrega.Calle + " " + DireccionEntrega.Numero + ". " + DireccionEntrega.Localidad;
                PedidoAMostrar.FechaPedido = PedidosEntidad[i].FechaPedido;
                PedidoAMostrar.IdPedido = PedidosEntidad[i].IdPedido;
                PedidoAMostrar.NombreUsuario = PedidosEntidad[i].NombreUsuario;
                PedidoAMostrar.NroPedido = PedidosEntidad[i].NroPedido;

                //PedidoEstadoPedidoEntidad Estado = pedidoCore.PedidoUltimoEstadoSelect(PedidosEntidad[i].IdPedido);
                //EstadoPedidoEntidad EstadoPedido = pedidoCore.EstadoPedidoSelect(Estado.IdEstadoPedido);

                PedidoAMostrar.Estado = PedidosEntidad[i].VerEstadoActual().DescripcionEstadoPedido;
                //PedidoAMostrar.Estado = EstadoPedido.DescripcionEstadoPedido;
                PedidosDetalle = pedidoCore.PedidosDetalleSelect(PedidosEntidad[i].IdPedido);
                PedidoAMostrar.Total = MontoTotalPorPedido(PedidosDetalle);
                PedidosaMostrar.Add(PedidoAMostrar);

            }

            grilladeultimospedidos.DataSource = null;
            PedidosaMostrar = (List<PedidoDTO>)PedidosaMostrar.OrderByDescending(X => X.NroPedido).ToList();
            grilladeultimospedidos.DataSource = PedidosaMostrar;
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
                    PedidoEntidad PedidoRow = pedidoCore.PedidoSelectByCUIT_NroPedidoCliente(usuarioentidad.CUIT, Convert.ToInt64(code));
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

                if (e.CommandName.Equals("CambiarEstado"))
                {
                    //variables
                    PedidoCore unManagerPedido = new PedidoCore();
                    var Current = HttpContext.Current;
                    PedidoEntidad unPedidoPagar = new PedidoEntidad();
                    SucursalCore ManagerSucursal = new SucursalCore();

                    //Inicializacion
                    int index = Convert.ToInt32(e.CommandArgument);
                    Int64 unNroPedido = Int64.Parse(grilladeultimospedidos.DataKeys[index].Value.ToString());

                    //Preparar parámetros a enviar a Avanzar()
                    logueado = (UsuarioEntidad)Current.Session["Usuario"];
                    unPedidoPagar = pedidoCore.PedidoSelectByCUIT_NroPedidoCliente(usuarioentidad.CUIT, unNroPedido);
                    unPedidoPagar.misDetalles = unManagerPedido.PedidosDetalleSelect(unPedidoPagar.IdPedido);
                    SucursalEntidad unaSucursal = ManagerSucursal.SucursalTraerPorDireccionSucursal(unPedidoPagar.miDireccionEntrega.IdDireccion);

                    //No se puede descancelar un Pedido
                    if (unPedidoPagar.VerEstadoActual().IdEstadoPedido == (int)EstadoPedidoEntidad.Options.Cancelado)
                    {
                        System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                        sb2.Append(@"<script type='text/javascript'>");
                        sb2.Append("$('#BloqueadoModifFinalizado').modal('show');");
                        sb2.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "ModalScript2", sb2.ToString(), false);
                    }

                    //Pendiente hacia Pago
                    if (unPedidoPagar.VerEstadoActual().IdEstadoPedido == (int)EstadoPedidoEntidad.Options.PendientePago)
                    {
                        unManagerPedido.AvanzarPaso(unPedidoPagar, unaSucursal, logueado, (int)FormaPagoEntidad.Options.Externa);
                    }

                    //Pago Hacia EnCamino
                    else if (unPedidoPagar.VerEstadoActual().IdEstadoPedido == (int)EstadoPedidoEntidad.Options.Pago && unPedidoPagar.miFormaEntrega.IdFormaEntrega == (int)FormaEntregaEntidad.Options.Correo)
                    {
                        //Obtener el nro de tracking ingresado en el modal
                        //El mismo es obtenido por una funcion jquery que se ejecuta por la clase del commandname actual, 
                        //..muestra el modal 'modaltracking' y al hacer click en 'Aceptar' del modal, se llama al webmethod "ObtenerTracking"
                        // y en backend se lo coloca en Session["tracking"] NO FUNCIONA
                        string unNroTracking = "TNK9966784523234";
                        //string unNroTracking = hdnfilename.Value.ToString();
                        //string unNroTracking = Current.Session["tracking"].ToString();
                        unManagerPedido.AvanzarPaso(unPedidoPagar, unNroTracking);
                    }

                    //Pago Hacia ListoRetirar
                    else if (unPedidoPagar.VerEstadoActual().IdEstadoPedido == (int)EstadoPedidoEntidad.Options.Pago && unPedidoPagar.miFormaEntrega.IdFormaEntrega == (int)FormaEntregaEntidad.Options.Sucursal)
                    {
                        unManagerPedido.AvanzarPaso(unPedidoPagar);
                    }

                    //EnCamino y/o ListoRetirar hacia Entregado
                    else if (unPedidoPagar.VerEstadoActual().IdEstadoPedido == (int)EstadoPedidoEntidad.Options.EnCamino | unPedidoPagar.VerEstadoActual().IdEstadoPedido == (int)EstadoPedidoEntidad.Options.ListoRetirar)
                    {
                        unManagerPedido.AvanzarPaso(unPedidoPagar);
                    }



                    //Era para seleccionar y modificar el estado a mano, ya no utilizado
                    //else
                    //{
                    //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //    sb.Append(@"<script type='text/javascript'>");
                    //    sb.Append("$('#currentestado').modal('show');");
                    //    sb.Append(@"</script>");
                    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    //               "ModalScript3", sb.ToString(), false);
                    //}//Abrir Modal que servía para el estado, pero ya no utilizado a partir del StatePatron
                    //CargarGrillaUltimosPedidos();
                    //Response.Redirect(Request.RawUrl);
                }

                if (e.CommandName.Equals("CancelarPedido"))
                {
                    //variables
                    PedidoCore unManagerPedido = new PedidoCore();
                    var Current = HttpContext.Current;
                    PedidoEntidad unPedidoPagar = new PedidoEntidad();
                    SucursalCore ManagerSucursal = new SucursalCore();

                    //Inicializacion
                    int index = Convert.ToInt32(e.CommandArgument);
                    Int64 unNroPedido = Int64.Parse(grilladeultimospedidos.DataKeys[index].Value.ToString());

                    //Preparar parámetros a enviar a Avanzar()
                    logueado = (UsuarioEntidad)Current.Session["Usuario"];
                    unPedidoPagar = pedidoCore.PedidoSelectByCUIT_NroPedidoCliente(usuarioentidad.CUIT, unNroPedido);

                    //Cancelar
                    if (unPedidoPagar.VerEstadoActual().IdEstadoPedido != (int)EstadoPedidoEntidad.Options.Cancelado)
                    {
                        unManagerPedido.CancelarPedido(unPedidoPagar);
                    }
                    //No se puede descancelar un pedido
                    else
                    {
                        System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                        sb2.Append(@"<script type='text/javascript'>");
                        sb2.Append("$('#BloqueadoModifFinalizado').modal('show');");
                        sb2.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "ModalScript7", sb2.ToString(), false);
                    }
                }
                CargarGrillaUltimosPedidos();
        }


        protected void grilladeultimospedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grilladeultimospedidos.PageIndex = e.NewPageIndex;
            CargarGrillaUltimosPedidos();
        }


        //[WebMethod(EnableSession = true)]
        //public static void ObtenerTracking(string elNroTracking)
        //{
        //    HttpContext Current = HttpContext.Current;
        //    Current.Session["tracking"] = elNroTracking;
        //}



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



        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            grilladeultimospedidos.DataSource = null;

            List<PedidoEntidad> Pedidos = new List<PedidoEntidad>();
            Pedidos = pedidoCore.SelectAllByCUIT(usuarioentidad.CUIT);

            List<PedidoEntidad> PedidosDeCliente = new List<PedidoEntidad>();
            List<PedidoDTO> PedidosAMostrarDelCliente = new List<PedidoDTO>();

            foreach (var pedido in Pedidos)
            {

                int ddlEstadoInt = Convert.ToInt32(ddlEstadoPedido.SelectedIndex + 1);
                if (pedido.NombreUsuario == txtClienteBusqueda.Text && pedido.VerEstadoActual().DescripcionEstadoPedido == ddlEstadoPedido.SelectedItem.Text)
                {

                    PedidoDTO PedidoAMostrar = new PedidoDTO();
                    PedidoAMostrar.cuit = pedido.CUIT;
                    DireccionEntidad DireccionEntrega = DireccionCore.DireccionSelect(pedido.miDireccionEntrega.IdDireccion);
                    PedidoAMostrar.DireccionEntrega = DireccionEntrega.Calle + " " + DireccionEntrega.Numero + ". " + DireccionEntrega.Localidad;
                    PedidoAMostrar.FechaPedido = pedido.FechaPedido;
                    PedidoAMostrar.IdPedido = pedido.IdPedido;
                    PedidoAMostrar.NombreUsuario = pedido.NombreUsuario;
                    PedidoAMostrar.NroPedido = pedido.NroPedido;

                    PedidoAMostrar.Estado = pedido.VerEstadoActual().DescripcionEstadoPedido;
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