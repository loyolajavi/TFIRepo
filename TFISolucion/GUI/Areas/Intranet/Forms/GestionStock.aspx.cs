using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Helpers;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class GestionStock : BasePage
    {
        List<ConsultaDTO> Consultas = new List<ConsultaDTO>();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        CategoriaCore CategoriaBLL = new CategoriaCore();
        EmpresaCore EmpresaBLL = new EmpresaCore();
        ProductoCore ProductoBLL = new ProductoCore();
        StockCore StockBLL1 = new StockCore();
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

            if (Consultas.Count > 0)
            {
                grillastock.DataSource = Consultas;
                grillastock.AutoGenerateColumns = false;

                if (!IsPostBack) { grillastock.DataBind(); }
            }

            if (!IsPostBack) { CargarDropdownProductos(); }
        }

        private void CargarDropdownProductos()
        {
            ddlProducto.DataSource = ProductoBLL.FindAllByCUIT(1);
            ddlProducto.DataValueField = "IdProducto";
            ddlProducto.DataTextField = "DescripProducto";
            ddlProducto.DataBind();
        }


        protected void btnGrabarStock_Click(object sender, EventArgs e)
        {
            CargarGrillaStock();
            Response.Redirect(Request.RawUrl);
        }

        private void CargarGrillaStock()
        {
            grillastock.DataSource = Consultas;
            grillastock.AutoGenerateColumns = false;
            grillastock.DataBind();
        }

        public class ConsultaDTO
        {

            public int IdProducto { get; set; }
            public string Descripcion { get; set; }
            public int CantidadEnStock { get; set; }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            Consultas.Clear();

            List<ProductoEntidad> productos = ProductoBLL.FindAllByDescripProducto(txtProductoaBuscar.Text);

            foreach (var item in productos)
            {

                List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
                StockDeProducto = StockBLL1.SelectByIdProducto(item.IdProducto);

                ConsultaDTO Consulta = new ConsultaDTO();
                Consulta.IdProducto = item.IdProducto;
                Consulta.Descripcion = item.DescripProducto;
                if (StockDeProducto.Count > 0)
                {
                    Consulta.CantidadEnStock = StockDeProducto[0].CantidadProducto;
                }
                else
                {
                    SucursalCore coreSucursal = new SucursalCore();
                    var listSucursales = coreSucursal.FindAll();

                    StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
                    NuevoStock.IdProducto = item.IdProducto;
                    NuevoStock.CantidadProducto = 0;
                    NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
                    NuevoStock.IdSucursal = listSucursales[0].IdSucursal; ;

                    StockCore StockBLL = new StockCore();
                    StockBLL.Insert(NuevoStock);

                    Consulta.CantidadEnStock = 0;
                }

                Consultas.Add(Consulta);

            }

            CargarGrillaStock();
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarStock(int producto, int stock)
        {
            var usuarioEntity = new UsuarioEntidad();
            var Current = HttpContext.Current;

            SucursalCore coreSucursal = new SucursalCore();
            var listSucursales = coreSucursal.FindAll();

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

            StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
            NuevoStock.IdProducto = producto;
            NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
            NuevoStock.IdSucursal = listSucursales[0].IdSucursal;
            NuevoStock.CantidadProducto = stock;

            StockCore StockBLL = new StockCore();

            List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
            StockDeProducto = StockBLL.SelectByIdProducto(NuevoStock.IdProducto);



            if (StockDeProducto.Count > 0)
            {
                if (stock < 0)
                {
                    int debesermayora0;
                    debesermayora0 = StockDeProducto[0].CantidadProducto + stock;
                    if (debesermayora0 >= 0)
                    {
                        NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + stock;
                        StockBLL.Update(NuevoStock);
                    }
                }
                else
                {
                    NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + stock;
                    StockBLL.Update(NuevoStock);
                }
            }
            else
            {
                if (stock < 0)
                {
                    int debesermayora0;
                    debesermayora0 = StockDeProducto[0].CantidadProducto + stock;
                    if (debesermayora0 >= 0)
                    {
                        NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + stock;
                        StockBLL.Insert(NuevoStock);
                    }
                    else
                    {
                        StockBLL.Insert(NuevoStock);
                    }


                }




            }
        }
        [WebMethod]
        public static List<String> ObtenerProductos()
        {
            var core = new ProductoCore();
            // var usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            // var cotizacion = new MonedaEmpresaEntidad();
            // cotizacion = (MonedaEmpresaEntidad)HttpContext.Current.Session["Cotizacion"];
            // var cot2 = Convert.ToInt32(cotizacion.IdMoneda);
            var productosEmpresa = core.FindAllByCUIT(1);

            return productosEmpresa.Select(x => x.DescripProducto).ToList();


        }

    }
}