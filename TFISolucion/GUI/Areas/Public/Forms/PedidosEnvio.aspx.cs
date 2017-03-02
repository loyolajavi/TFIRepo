using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

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

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();
            var Current = HttpContext.Current;
            logueado = (UsuarioEntidad)Current.Session["Usuario"];
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

            seleccionado = (int?)Current.Session["Seleccionada"];
            formaEnvioId = (int?)Current.Session["FormaEnvio"];
            Current.Session["FormaEnvio"] = 1;
            if (logueado == null)
                Response.Redirect("Pedidos.aspx");

            sucursalesDisponibles = _sucursalCore.FindAll();
        }

        [WebMethod]
        public static void Seleccionar(int? id)
        {
            HttpContext.Current.Session["Seleccionada"] = id;
        }

        [WebMethod]
        public static void FormaEnvio(int id)
        {
            HttpContext.Current.Session["FormaEnvio"] = id;
            if (id == (int)FormaEntregaEntidad.Options.Correo) {

                SucursalCore gestorSucursal = new SucursalCore();
                var sucursales = gestorSucursal.FindAll();
                
                HttpContext.Current.Session["Seleccionada"] = sucursales[0].IdSucursal;
            }
               
        }

        
    }
}