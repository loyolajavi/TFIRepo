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
    public partial class GestionContenidoProdCat : System.Web.UI.Page
    {
        List<ConsultaDTO> Consultas = new List<ConsultaDTO>();
        CategoriaCore CategoriaBLL = new CategoriaCore();
        EmpresaCore EmpresaBLL = new EmpresaCore();
        ProductoCore ProductoBLL = new ProductoCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Consultas.Count > 0)
            {
                grillacatprod.DataSource = Consultas;
                grillacatprod.AutoGenerateColumns = false;

                if (!IsPostBack) { grillacatprod.DataBind(); }
            }

            if (!IsPostBack) { CargarDropdownCategorias(); }

            if (!IsPostBack) { CargarDropdownProductos(); }
        }

        protected void CargarGrillaCatProd()
        {
            grillacatprod.DataSource = Consultas;
            grillacatprod.AutoGenerateColumns = false;
            grillacatprod.DataBind();
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            Consultas.Clear();


            List<ProductoEntidad> productos = ProductoBLL.FindAllByDescripProducto(txtProductoaBuscar.Text);

            foreach (var item in productos)
            {

                List<CategoriaEntidad> CategoriasDeProducto = new List<CategoriaEntidad>();
                CategoriasDeProducto = ProductoBLL.ProductoSelectAllCategorias(item.IdProducto);

                foreach (var cat in CategoriasDeProducto)
                {

                    ConsultaDTO Consulta = new ConsultaDTO();
                    Consulta.IdProducto = item.IdProducto;
                    Consulta.IdCategoria = cat.IdCategoria;
                    Consulta.Descripcion = item.DescripProducto;
                    Consulta.DescripCategoria = cat.DescripCategoria;

                    Consultas.Add(Consulta);
                }

            }

            CargarGrillaCatProd();
        }

        public class ConsultaDTO
        {

            public int IdProducto { get; set; }
            public int IdCategoria { get; set; }
            public string Descripcion { get; set; }
            public string DescripCategoria { get; set; }
        }

        protected void btnGrabarAsociacion_Click(object sender, EventArgs e)
        {
            CargarGrillaCatProd();
            Response.Redirect(Request.RawUrl);

        }

        protected void CargarDropdownCategorias()
        {
            ddlCategoria.DataSource = EmpresaBLL.SeleccionarCategorias(ConfigSection.Default.Site.Cuit);
            ddlCategoria.DataValueField = "IdCategoria";
            ddlCategoria.DataTextField = "DescripCategoria";
            ddlCategoria.DataBind();
        }

        protected void CargarDropdownProductos()
        {
            ddlProducto.DataSource = ProductoBLL.FindAllByCUIT();
            ddlProducto.DataValueField = "IdProducto";
            ddlProducto.DataTextField = "DescripProducto";
            ddlProducto.DataBind();
        }

        protected void grillacatprod_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ProdCategoriaEntidad AsociacionAEliminar = new ProdCategoriaEntidad();
            GridViewRow row = (GridViewRow)grillacatprod.Rows[e.RowIndex];
            var IdProducto = ((string)row.Cells[1].Text);
            var IdCategoria = ((string)row.Cells[3].Text);
            AsociacionAEliminar.IdProducto = Convert.ToInt32(IdProducto);
            AsociacionAEliminar.IdCategoria = Convert.ToInt32(IdCategoria);
            CategoriaBLL.CategoriaProdDelete(AsociacionAEliminar.IdProducto, AsociacionAEliminar.IdCategoria);
            Response.Redirect(Request.RawUrl);

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarAsociacion(int producto, int categoria)
        {
            var usuarioEntity = new UsuarioEntidad();
            var Current = HttpContext.Current;

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

            ProdCategoriaEntidad NuevaAsociacion = new ProdCategoriaEntidad();

            NuevaAsociacion.IdProducto = producto;
            NuevaAsociacion.IdCategoria = categoria;
            NuevaAsociacion.CUIT = ConfigSection.Default.Site.Cuit;

            ProductoCore UnCoreProducto = new ProductoCore();
            UnCoreProducto.ProductoCategoriaInsert(NuevaAsociacion);

        }
    }
}