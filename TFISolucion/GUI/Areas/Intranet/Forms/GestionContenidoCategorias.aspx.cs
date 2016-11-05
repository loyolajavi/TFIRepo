using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;
using TFI.Entidades;
using System.Web.Script.Services;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class GestionContenidoCategorias : System.Web.UI.Page
    {

        List<CategoriaEntidad> CategoriasDeEmpresa = new List<CategoriaEntidad>();
        EmpresaCore EmpresaBLL = new EmpresaCore();
        CategoriaCore CategoriaBLL = new CategoriaCore();

        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriasDeEmpresa = EmpresaBLL.SeleccionarCategorias(ConfigSection.Default.Site.Cuit);
            grillacategorias.DataSource = CategoriasDeEmpresa;
            grillacategorias.AutoGenerateColumns = false;
            if (!IsPostBack)
            {
                grillacategorias.DataBind();
            }

        }

        protected void CargarGrillaDeCategorias()
        {
            CategoriasDeEmpresa = EmpresaBLL.SeleccionarCategorias(ConfigSection.Default.Site.Cuit);
            grillacategorias.DataSource = CategoriasDeEmpresa;
            grillacategorias.AutoGenerateColumns = false;
            grillacategorias.DataBind();
        }

        protected void btnGrabarCategoria_Click(object sender, EventArgs e)
        {
            CargarGrillaDeCategorias();
            Response.Redirect(Request.RawUrl);

        }
        protected void grillacategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grillacategorias.EditIndex = -1;
            grillacategorias.DataBind();

        }

        protected void grillacategorias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CategoriaEntidad CategoriaActualizada = new CategoriaEntidad();


            GridViewRow row = grillacategorias.Rows[e.RowIndex];
            var IdCategoria = ((TextBox)row.Cells[2].Controls[0]).Text;
            var Descripcion = ((TextBox)row.Cells[3].Controls[0]).Text;

            CategoriaActualizada.IdCategoria = Convert.ToInt32(IdCategoria);
            CategoriaActualizada.DescripCategoria = Descripcion;
            CategoriaActualizada.CUIT = ConfigSection.Default.Site.Cuit;

            CategoriaBLL.CategoriaUpdate(CategoriaActualizada);

            //////Reset the edit index.
            grillacategorias.EditIndex = -1;

            ////////Bind data to the GridView control.
            grillacategorias.DataBind();

            Response.Redirect(Request.RawUrl);

        }

        protected void grillacategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CategoriaEntidad CategoriaAEliminar = new CategoriaEntidad();
            GridViewRow row = (GridViewRow)grillacategorias.Rows[e.RowIndex];
            var IdCategoria = ((string)row.Cells[2].Text);
            CategoriaAEliminar.IdCategoria = Convert.ToInt32(IdCategoria);
            CategoriaBLL.CategoriaDelete(CategoriaAEliminar.IdCategoria);

            Response.Redirect(Request.RawUrl);

        }


        protected void grillacategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grillacategorias.EditIndex = e.NewEditIndex;
            grillacategorias.DataBind();
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void GrabarCategoria(string descripcion)
        {

            var usuarioEntity = new UsuarioEntidad();
            var Current = HttpContext.Current;

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

            CategoriaEntidad NuevaCategoria = new CategoriaEntidad();

            NuevaCategoria.CUIT = ConfigSection.Default.Site.Cuit;
            NuevaCategoria.DescripCategoria = descripcion;

            CategoriaCore UnCoreCat = new CategoriaCore();
            UnCoreCat.CategoriaInsert(NuevaCategoria);

        }
    }
}