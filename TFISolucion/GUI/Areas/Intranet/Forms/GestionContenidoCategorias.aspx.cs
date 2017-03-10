using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.CORE.Helpers;
using TFI.Entidades;
using System.Web.Script.Services;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class GestionContenidoCategorias : BasePage
    {

        List<CategoriaEntidad> CategoriasDeEmpresa = new List<CategoriaEntidad>();
        EmpresaCore EmpresaBLL = new EmpresaCore();
        CategoriaCore CategoriaBLL = new CategoriaCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private GestionContenidoCategorias gcat;
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
            notificationcategoria.Visible = false;
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

            var formulario = new GestionContenidoCategorias();

            var usuarioEntity = new UsuarioEntidad();
            var Current = HttpContext.Current;

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];
            Regex reg = new Regex("[0-9]"); //Expresión que solo acepta números.

            bool b = reg.IsMatch(descripcion);

            CategoriaEntidad NuevaCategoria = new CategoriaEntidad();
            NuevaCategoria.CUIT = ConfigSection.Default.Site.Cuit;
            if (descripcion == "" || b)
            {

                //formulario.ValidaDescripcionCategoria();
            }
            else
            {
                NuevaCategoria.DescripCategoria = descripcion;


                CategoriaCore UnCoreCat = new CategoriaCore();
                var categorias = UnCoreCat.SeleccionarCategorias();
                var q = from cat in categorias
                        where cat.DescripCategoria == NuevaCategoria.DescripCategoria
                        select cat;
                var qr = categorias.FirstOrDefault(x => x.DescripCategoria == NuevaCategoria.DescripCategoria);
                if (qr == null)
                { UnCoreCat.CategoriaInsert(NuevaCategoria); }
                else
                {
                    formulario.ValidaDescripcionCategoria();
                }
            }
        }
        private void ValidaDescripcionCategoria()
        {
            notificationcategoria = new HtmlGenericControl();
            notificationcategoria.Visible = true;
            notificationcategoria.InnerHtml = "Ingrese una categoria valida";


            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Ingrese una categoria');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                       "ModalScript", sb.ToString(), false);
        }

    }
}