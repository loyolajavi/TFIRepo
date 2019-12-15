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
    public partial class GestionContenidoProdCat : BasePage
    {
        List<ConsultaDTO> Consultas = new List<ConsultaDTO>();
        CategoriaCore CategoriaBLL = new CategoriaCore();
        EmpresaCore EmpresaBLL = new EmpresaCore();
        ProductoCore ProductoBLL = new ProductoCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        List<CategoriaEntidad> unasCategorias = new List<CategoriaEntidad>();
        HttpContext Current = HttpContext.Current;
        int IdProdAux = 0;

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

            string[] unosPermisosTest = new string[] { "Publico", "Cliente" };
            if (usuarioentidad == null || this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }

            if (Consultas.Count > 0)
            {
                grillacatprod.DataSource = Consultas;
                grillacatprod.AutoGenerateColumns = false;

                if (!IsPostBack) { grillacatprod.DataBind(); }
            }

            if (!IsPostBack) 
            { 
                unasCategorias = EmpresaBLL.SeleccionarCategorias(ConfigSection.Default.Site.Cuit);
                Current.Session["unasCategoriasFiltradas"] = unasCategorias;
                IdProdAux = 0;
                Current.Session["IdProdAux"] = IdProdAux;
                CargarCategorias();
            }
            else
            {
                if (Current.Session["unasCategoriasFiltradas"] != null)
                    unasCategorias = (List<CategoriaEntidad>)Current.Session["unasCategoriasFiltradas"];
                if (Current.Session["IdProdAux"] != null)
                    IdProdAux = (int)Current.Session["IdProdAux"];
                    
            }

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
            ActualizarCategoriasFiltradas();
        }

        public void ActualizarCategoriasFiltradas()
        {
            List<CategoriaEntidad> CategoriasDeProducto = new List<CategoriaEntidad>();
            List<ProductoEntidad> productos = ProductoBLL.FindAllByDescripProducto(txtProductoaBuscar.Text);

            if (productos != null && productos.Count > 0)
            {
                CategoriasDeProducto = ProductoBLL.ProductoSelectAllCategorias(productos.First().IdProducto);
                IdProdAux = productos.First().IdProducto;
                Current.Session["IdProdAux"] = IdProdAux;

                foreach (var cat in CategoriasDeProducto)
                {

                    ConsultaDTO Consulta = new ConsultaDTO();
                    Consulta.IdProducto = productos.First().IdProducto;
                    Consulta.IdCategoria = cat.IdCategoria;
                    Consulta.Descripcion = productos.First().DescripProducto;
                    Consulta.DescripCategoria = cat.DescripCategoria;

                    Consultas.Add(Consulta);
                }

                unasCategorias = EmpresaBLL.SeleccionarCategorias(ConfigSection.Default.Site.Cuit);
                unasCategorias = unasCategorias.Where(X => !CategoriasDeProducto.Any(Y => Y.IdCategoria == X.IdCategoria)).ToList();
                CargarCategorias();
                Current.Session["unasCategoriasFiltradas"] = unasCategorias;
                CargarGrillaCatProd();
            }
        }


        public class ConsultaDTO
        {

            public int IdProducto { get; set; }
            public int IdCategoria { get; set; }
            public string Descripcion { get; set; }
            public string DescripCategoria { get; set; }
        }



        //protected void CargarDropdownCategorias()
        //{
        //    ddlCategoria.DataSource = EmpresaBLL.SeleccionarCategorias(ConfigSection.Default.Site.Cuit); 
        //    ddlCategoria.DataValueField = "IdCategoria";
        //    ddlCategoria.DataTextField = "DescripCategoria";
        //    ddlCategoria.DataBind();
        //}

        protected void CargarCategorias()
        {
            cboCategoria.DataSource = unasCategorias;
            cboCategoria.DataValueField = "IdCategoria";
            cboCategoria.DataTextField = "DescripCategoria";
            cboCategoria.DataBind();
        }

        //protected void CargarDropdownProductos()
        //{
        //    ddlProducto.DataSource = ProductoBLL.FindAllByCUIT(1);
        //    ddlProducto.DataValueField = "IdProducto";
        //    ddlProducto.DataTextField = "DescripProducto";
        //    ddlProducto.DataBind();
        //}

        protected void grillacatprod_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ProdCategoriaEntidad AsociacionAEliminar = new ProdCategoriaEntidad();
            GridViewRow row = (GridViewRow)grillacatprod.Rows[e.RowIndex];
            var IdCategoria = ((string)row.Cells[3].Text);
            AsociacionAEliminar.IdProducto = IdProdAux;
            AsociacionAEliminar.IdCategoria = Convert.ToInt32(IdCategoria);
            CategoriaBLL.CategoriaProdDelete(AsociacionAEliminar.IdProducto, AsociacionAEliminar.IdCategoria);
            ActualizarCategoriasFiltradas();

        }


        protected void btnGrabarAsociacion_Click(object sender, EventArgs e)
        {
            if (IdProdAux > 0)
            {
                ProdCategoriaEntidad NuevaAsociacion = new ProdCategoriaEntidad();

                NuevaAsociacion.IdProducto = IdProdAux;
                NuevaAsociacion.IdCategoria = Int32.Parse(cboCategoria.SelectedValue);
                NuevaAsociacion.CUIT = ConfigSection.Default.Site.Cuit;

                ProductoCore UnCoreProducto = new ProductoCore();
                UnCoreProducto.ProductoCategoriaInsert(NuevaAsociacion);

                ActualizarCategoriasFiltradas();
                Current.Session["IdProdAux"] = null;
                IdProdAux = 0;
                Current.Session["unasCategoriasFiltradas"] = null;
                unasCategorias.Clear();
            }
        }


        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //[System.Web.Services.WebMethod]
        //public static void GrabarAsociacion(int producto, int categoria)
        //{
        //    var usuarioEntity = new UsuarioEntidad();
        //    var Current = HttpContext.Current;

        //    usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

        //    ProdCategoriaEntidad NuevaAsociacion = new ProdCategoriaEntidad();

        //    NuevaAsociacion.IdProducto = producto;
        //    NuevaAsociacion.IdCategoria = categoria;
        //    NuevaAsociacion.CUIT = ConfigSection.Default.Site.Cuit;

        //    ProductoCore UnCoreProducto = new ProductoCore();
        //    UnCoreProducto.ProductoCategoriaInsert(NuevaAsociacion);

        //}



    }
}