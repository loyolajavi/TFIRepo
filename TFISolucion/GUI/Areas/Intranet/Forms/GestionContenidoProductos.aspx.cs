using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.CORE.Helpers;
using TFI.CORE.Managers;
using System.Web.Script.Services;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class GestionContenidoProductos : System.Web.UI.Page
    {

        List<ProductoDTO> ProductosenGrilla = new List<ProductoDTO>();
        List<ProductoEntidad> ProductosDeEmpresa = new List<ProductoEntidad>();
        EmpresaCore EmpresaBLL = new EmpresaCore();
        ProductoCore ProductoBLL = new ProductoCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoCore ProductoBLL = new ProductoCore();
            ProductosDeEmpresa = ProductoBLL.FindAllByCUIT();

            foreach (var prod in ProductosDeEmpresa)
            {
                ProductoDTO producto = new ProductoDTO();
                producto.CodigoProducto = prod.CodigoProducto;
                producto.Descripcion = prod.DescripProducto;
                producto.DescripLarga = prod.DescripLarga;
                producto.PrecioUnitario = Convert.ToDecimal(prod.PrecioUnitario);
                producto.URL = prod.URL;

                ProductosenGrilla.Add(producto);
            }

            grillaproductos.DataSource = ProductosenGrilla;
            grillaproductos.AutoGenerateColumns = false;
            if (!IsPostBack)
            {
                grillaproductos.DataBind();
            }

            if (!IsPostBack)
            {
                CargarDropdownMarca();
            }

            if (!IsPostBack)
            {
                CargarDropdownIVA();
            }
            if (!IsPostBack)
            {
                CargarDropdownCategorias();
            }

        }

        private void CargarGrillaProductos()
        {

            ProductoCore ProductoBLL = new ProductoCore();
            ProductosDeEmpresa = ProductoBLL.FindAllByCUIT();

            foreach (var prod in ProductosDeEmpresa)
            {
                ProductoDTO producto = new ProductoDTO();
                producto.CodigoProducto = prod.CodigoProducto;
                producto.Descripcion = prod.DescripProducto;
                producto.DescripLarga = prod.DescripLarga;
                producto.PrecioUnitario = prod.PrecioUnitario;
                producto.URL = prod.URL;

                ProductosenGrilla.Add(producto);
            }

            grillaproductos.DataSource = ProductosenGrilla;
            grillaproductos.AutoGenerateColumns = false;


            if (!IsPostBack)
            {
                grillaproductos.DataBind();
            }

        }

        public class ProductoDTO
        {

            public string CodigoProducto { get; set; }
            public string Descripcion { get; set; }
            public decimal PrecioUnitario { get; set; }
            public string URL { get; set; }
            public string DescripLarga { get; set; }

        }

        protected void btnGrabarProducto_Click(object sender, EventArgs e)
        {
            CargarGrillaProductos();
            Response.Redirect(Request.RawUrl);
        }

        protected void grillaproductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grillaproductos.EditIndex = -1;
            grillaproductos.DataBind();

        }

        protected void grillaproductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ProductoEntidad ProductoActualizado = new ProductoEntidad();


            GridViewRow row = grillaproductos.Rows[e.RowIndex];
            var CodigoProducto = ((TextBox)row.Cells[2].Controls[0]).Text;
            var Descripcion = ((TextBox)row.Cells[3].Controls[0]).Text;
            var Marca = ((DropDownList)row.Cells[4].Controls[1]).SelectedIndex + 1;
            var IVA = ((DropDownList)row.Cells[5].Controls[1]).SelectedIndex + 1;
            var PrecioUnitario = ((TextBox)row.Cells[6].Controls[0]).Text;
            var URL = ((TextBox)row.Cells[7].Controls[0]).Text;
            var Detalle = ((TextBox)row.Cells[8].Controls[0]).Text;

            var ProductoE = ProductosDeEmpresa.Where(X => X.CodigoProducto == CodigoProducto).First();

            ProductoActualizado.IdProducto = ProductoE.IdProducto;
            ProductoActualizado.CUIT = ConfigSection.Default.Site.Cuit;
            ProductoActualizado.CodigoProducto = CodigoProducto;
            ProductoActualizado.DescripProducto = Descripcion;
            ProductoActualizado.IdMarca = Marca;
            ProductoActualizado.IdIvaProducto = IVA;
            ProductoActualizado.PrecioUnitario = Convert.ToDecimal(PrecioUnitario);
            ProductoActualizado.URL = URL;
            ProductoActualizado.DescripLarga = Detalle;

            ProductoBLL.ProductoUpdate(ProductoActualizado);

            //////Reset the edit index.
            grillaproductos.EditIndex = -1;

            ////////Bind data to the GridView control.
            grillaproductos.DataBind();

            Response.Redirect(Request.RawUrl);

        }

        protected void grillaproductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ProductoEntidad ProductoAEliminar = new ProductoEntidad();
            GridViewRow row = (GridViewRow)grillaproductos.Rows[e.RowIndex];
            var CodigoProducto = ((string)row.Cells[2].Text);
            var ProductoE = ProductosDeEmpresa.Where(X => X.CodigoProducto == CodigoProducto).First();
            ProductoAEliminar.IdProducto = ProductoE.IdProducto;
            ProductoBLL.ProdCategoriaDeleteByProducto(ProductoAEliminar.IdProducto);
            ProductoBLL.ProductoDelete(ProductoAEliminar.IdProducto);

            Response.Redirect(Request.RawUrl);

        }

        protected void grillaproductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string codigo;

                if (e.Row.RowIndex == grillaproductos.EditIndex)
                {
                    codigo = ((TextBox)e.Row.Cells[2].Controls[0]).Text;

                }
                else
                {
                    codigo = (string)e.Row.Cells[2].Text;
                }


                var ProductoE = ProductosDeEmpresa.Where(X => X.CodigoProducto == codigo).First();

                var dropdownMarca = e.Row.FindControl("dropdownMarca") as DropDownList;
                if (dropdownMarca != null)
                {
                    dropdownMarca.DataSource = EmpresaBLL.SeleccionarMarcas();
                    dropdownMarca.DataValueField = "IdMarca";
                    dropdownMarca.DataTextField = "DescripcionMarca";
                    var marcaEntidad = ProductoBLL.MarcaSelect(ProductoE.IdMarca);
                    dropdownMarca.SelectedValue = marcaEntidad.IdMarca.ToString();
                    dropdownMarca.DataBind();

                }

                var ddlIVA = e.Row.FindControl("ddlIva") as DropDownList;
                if (ddlIVA != null)
                {
                    ddlIVA.DataSource = EmpresaBLL.SeleccionarIvaProducto();
                    ddlIVA.DataValueField = "IdIvaProducto";
                    ddlIVA.DataTextField = "PorcentajeIvaProd";
                    ddlIVA.SelectedValue = ProductoE.IdIvaProducto.ToString();
                    ddlIVA.DataBind();

                }




            }
        }

        protected void CargarDropdownCategorias()
        {
            ddlcategoriamodal.DataSource = EmpresaBLL.SeleccionarCategorias(ConfigSection.Default.Site.Cuit);
            ddlcategoriamodal.DataValueField = "IdCategoria";
            ddlcategoriamodal.DataTextField = "DescripCategoria";
            ddlcategoriamodal.DataBind();


        }

        protected void CargarDropdownMarca()
        {
            ddlmarcamodal.DataSource = EmpresaBLL.SeleccionarMarcas();
            ddlmarcamodal.DataValueField = "IdMarca";
            ddlmarcamodal.DataTextField = "DescripcionMarca";
            ddlmarcamodal.DataBind();


        }

        protected void CargarDropdownIVA()
        {

            ddlivamodal.DataSource = EmpresaBLL.SeleccionarIvaProducto();
            ddlivamodal.DataValueField = "IdIvaProducto";
            ddlivamodal.DataTextField = "PorcentajeIvaProd";
            ddlivamodal.DataBind();

        }

        protected void grillaproductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grillaproductos.EditIndex = e.NewEditIndex;
            grillaproductos.DataBind();
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarProducto(string codigoproducto, string descripcion, int marca, int iva, decimal precio, string url, string detalle, int categoria)
        {

            var usuarioEntity = new UsuarioEntidad();
            var Current = HttpContext.Current;

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

            ProductoEntidad NuevoProducto = new ProductoEntidad();

            NuevoProducto.CUIT = ConfigSection.Default.Site.Cuit;
            NuevoProducto.CodigoProducto = codigoproducto;
            NuevoProducto.DescripProducto = descripcion;
            NuevoProducto.IdMarca = marca;
            NuevoProducto.IdIvaProducto = iva;
            NuevoProducto.PrecioUnitario = Convert.ToDecimal(precio);
            NuevoProducto.URL = url;
            NuevoProducto.DescripLarga = detalle;

            ProductoCore UnCoreProducto = new ProductoCore();
            int id = UnCoreProducto.ProductoInsert(NuevoProducto);

            ProdCategoriaEntidad NuevaIntermedia = new ProdCategoriaEntidad();
            NuevaIntermedia.IdCategoria = categoria;
            NuevaIntermedia.IdProducto = id;
            NuevaIntermedia.CUIT = ConfigSection.Default.Site.Cuit;

            UnCoreProducto.ProductoCategoriaInsert(NuevaIntermedia);

        }
    }
}