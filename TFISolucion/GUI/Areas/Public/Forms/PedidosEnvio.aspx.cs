using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.GUI.Helpers.DTO;

namespace TFI.GUI.Areas.Public.Forms
    //namespace TFI.GUI
{
    public partial class PedidosEnvio : BasePage
    {
        public UsuarioEntidad logueado;
        public List<SucursalEntidad> sucursalesDisponibles;
        public int? seleccionado;
        public int? formaEnvioId;
        private LenguajeEntidad idioma;
        public List<PedidoLista> ProdCantEnPedido;
        public List<PedidoDetalleEntidad> unosPedidosDetalles;//Para guardar los productos y consultar las sucursales con stock
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

        private SucursalCore _sucursalCore;

        public PedidosEnvio()
        {
            idioma = new LenguajeEntidad();
            _sucursalCore = new SucursalCore();
        }

        //Para mantener la sesión activa
        [WebMethod(EnableSession = true)]
        public static void MantenerSesion()
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //En caso de no tener un Pedido vigente redirige a home
            var Current = HttpContext.Current;
            if (Current.Session["Productos"] == null)
                Response.Redirect("/Areas/Public/Forms/Home.aspx");

            idioma = new LenguajeEntidad();
            logueado = (UsuarioEntidad)Current.Session["Usuario"];
            //Para armar lista PedidosDetalles y enviarlo como param a la BLL y obtener sucursales con stock suficiente
            ProdCantEnPedido = (List<PedidoLista>)Current.Session["Pedido"];
            if (ProdCantEnPedido != null && ProdCantEnPedido.Count > 0)
            {
                unosPedidosDetalles = new List<PedidoDetalleEntidad>();
                PedidoDetalleEntidad unPedDet;
                //Para armar lista PedidosDetalles y enviarlo como param a la BLL y obtener sucursales con stock suficiente
                foreach (PedidoLista UnProdCant in ProdCantEnPedido)
                {
                    unPedDet = new PedidoDetalleEntidad();
                    unPedDet.IdProducto = UnProdCant.Producto.IdProducto;
                    unPedDet.Cantidad = UnProdCant.Cantidad;
                    unosPedidosDetalles.Add(unPedDet);
                }
            }
            //Fin: //Para armar lista PedidosDetalles y enviarlo como param a la BLL y obtener sucursales con stock suficiente

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

            
            formaEnvioId = (int?)Current.Session["FormaEnvio"];
            Current.Session["FormaEnvio"] = 1;//REVISAR
            if (logueado == null)
                Response.Redirect("Pedidos.aspx");
            //Antes obtenía todas las sucursales
            //sucursalesDisponibles = _sucursalCore.FindAll();
            //Ahora se obtienen las que poseen stock unicamente
            sucursalesDisponibles = _sucursalCore.TraerSucursalesConStock(unosPedidosDetalles);
            Session.Add("SucursalesDisponibles", sucursalesDisponibles); //Guardo en Sesión las sucursales disponibles para tomarlas en WebMethod "FormaEnvio"
            HttpContext.Current.Session["Seleccionada"] = sucursalesDisponibles[0].IdSucursal;//Sucursal seleccionada, en este momento la primera que tiene stock
            seleccionado = sucursalesDisponibles[0].IdSucursal; //Sucursal seleccionada, en este momento la primera que tiene stock, por si no hago click y queda
                                                                //seleccionado Envío por correo

        }

        [WebMethod]
        public static void Seleccionar(int? id)
        {
            HttpContext.Current.Session["Seleccionada"] = id;//Sucursal seleccionada
        }

        [WebMethod]
        public static void FormaEnvio(int id)
        {
            HttpContext.Current.Session["FormaEnvio"] = id;
            if (id == (int)FormaEntregaEntidad.Options.Correo) {
                //SucursalCore gestorSucursal = new SucursalCore();
                //var sucursales = gestorSucursal.FindAll();
                List<SucursalEntidad> sucursalesDisponibles = HttpContext.Current.Session["SucursalesDisponibles"] as List<SucursalEntidad>;
                //if (sucursales.Exists(X=>X.IdSucursal == sucursales[0].IdSucursal))
                HttpContext.Current.Session["Seleccionada"] = sucursalesDisponibles[0].IdSucursal;
            }
               
        }

        
    }
}