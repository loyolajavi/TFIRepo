using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Helpers;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class GestionStock : System.Web.UI.Page
    {
        List<ConsultaDTO> Consultas = new List<ConsultaDTO>();
        CategoriaCore CategoriaBLL = new CategoriaCore();
        EmpresaCore EmpresaBLL = new EmpresaCore();
        ProductoCore ProductoBLL = new ProductoCore();
        StockCore StockBLL1 = new StockCore();

        protected void Page_Load(object sender, EventArgs e)
        {
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
            ddlProducto.DataSource = ProductoBLL.FindAllByCUIT();
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
                    StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
                    NuevoStock.IdProducto = item.IdProducto;
                    NuevoStock.CantidadProducto = 0;
                    NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
                    NuevoStock.IdSucursal = 1;

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

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

            StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
            NuevoStock.IdProducto = producto;
            NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
            NuevoStock.IdSucursal = 1;

            StockCore StockBLL = new StockCore();

            List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
            StockDeProducto = StockBLL.SelectByIdProducto(NuevoStock.IdProducto);

           

            if (StockDeProducto.Count > 0)
            {

                NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + stock;
                StockBLL.Update(NuevoStock);

            }
            else
            {
                StockBLL.Insert(NuevoStock);
            }

        
            

        }

    }
}