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
using TFI.GUI;

namespace TFI.CORE.Areas.Intranet.Forms
{
    public partial class GestionMoneda : BasePage
    {
        private MonedaCore _managerMoneda;
        private List<MonedaEntidad> listaMonedas;
        //  private CotizacionDTO _cotizacion;
        private List<CotizacionDTO> listaCotizacion;
        // private List<MonedaEmpresaEntidad> listaMonedasEmpresa;
        private CotizacionDTO unaCotizacion;
        private UsuarioEntidad usuarioLoeado = new UsuarioEntidad();
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
            usuarioLoeado = (UsuarioEntidad)Session["Usuario"];

            //if (usuarioLoeado == null)
            //{
            //    Response.Redirect("/Areas/Public/Forms/Home.aspx");
            //}
            _managerMoneda = new MonedaCore();
            listaMonedas = new List<MonedaEntidad>();
            listaCotizacion = new List<CotizacionDTO>();

            listaMonedas = _managerMoneda.FinAllMonedasByEmpresa();
            grillaCotizacion.DataSource = CargarCotizaciones();
            grillaCotizacion.AutoGenerateColumns = false;
            if (!IsPostBack)
            {

                grillaCotizacion.DataBind();

                //grillaMoneda.DataBind();

            }

        }

        //protected void y()
        //{
        //    listaMonedas = _managerMoneda.FinAllMonedasByEmpresa();
        //    //grillaMoneda.DataSource = listaMonedas;
        //    //grillaMoneda.AutoGenerateColumns = false;
        //    //grillaMoneda.DataBind();
        //}


        protected List<CotizacionDTO> CargarCotizaciones()
        {
            // listaMonedas = _managerMoneda.FinAllMonedasByEmpresa();
            listaCotizacion.Clear();
            foreach (MonedaEntidad unaMoneda in listaMonedas)
            {

                MonedaEmpresaEntidad monedaDeEmpresa = _managerMoneda.Select(unaMoneda.IdMoneda);
                unaCotizacion = new CotizacionDTO();
                unaCotizacion.Cotizacion = monedaDeEmpresa.Cotizacion;
                unaCotizacion.Fecha = monedaDeEmpresa.Fecha;
                unaCotizacion.Nombre = unaMoneda.Nombre;
                unaCotizacion.SimboloMoneda = unaMoneda.SimboloMoneda;
                unaCotizacion.Url = unaMoneda.Url;
                unaCotizacion.IdMoneda = monedaDeEmpresa.IdMoneda;

                //  listaMonedasEmpresa.Add(monedaDeEmpresa);
                listaCotizacion.Add(unaCotizacion);

            }
            return listaCotizacion;


        }

        //protected void btnGrabarMoneda_Click(object sender, EventArgs e)
        //{
        //    CargarGrillaDeMonedas();
        //    Response.Redirect(Request.RawUrl);

        //}
        //protected void grillaMoneda_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    grillaMoneda.EditIndex = -1;
        //    grillaMoneda.DataBind();

        //}

        //protected void grillaMoneda_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    MonedaEntidad moneda = new MonedaEntidad();


        //    GridViewRow row = grillaMoneda.Rows[e.RowIndex];
        //    var IdMoneda = ((TextBox)row.Cells[2].Controls[0]).Text;
        //    var Nombre = ((TextBox)row.Cells[3].Controls[0]).Text;
        //    var SimboloMoneda = ((TextBox)row.Cells[4].Controls[0]).Text;

        //    moneda.IdMoneda = Convert.ToInt32(IdMoneda);
        //    moneda.Nombre = Nombre;
        //    moneda.SimboloMoneda = SimboloMoneda;

        //    _managerMoneda.MonedaInsert(moneda);

        //    //////Reset the edit index.
        //    grillaMoneda.EditIndex = -1;

        //    ////////Bind data to the GridView control.
        //    grillaMoneda.DataBind();

        //    Response.Redirect(Request.RawUrl);

        //}

        //protected void grillaMoneda_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    MonedaEntidad moneda = new MonedaEntidad();
        //    GridViewRow row = (GridViewRow)grillaMoneda.Rows[e.RowIndex];
        //    var IdMoneda = ((string)row.Cells[2].Text);
        //    moneda.IdMoneda = Convert.ToInt32(IdMoneda);


        //    Response.Redirect(Request.RawUrl);

        //}


        //protected void grillaMoneda_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    grillaMoneda.EditIndex = e.NewEditIndex;
        //    grillaMoneda.DataBind();
        //}

        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //[System.Web.Services.WebMethod]
        //public static void GrabarMoneda(string Nombre, string SimboloMoneda)
        //{

        //    // var usuarioEntity = new UsuarioEntidad();
        //    //var Current = HttpContext.Current;

        //    // usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

        //    // CategoriaEntidad NuevaCategoria = new CategoriaEntidad();
        //    var nuevaMoneda = new MonedaEntidad();

        //    nuevaMoneda.Nombre = Nombre;
        //    nuevaMoneda.SimboloMoneda = SimboloMoneda;
        //    // nuevaMoneda.Url = Url;
        //    MonedaCore coreMoneda = new MonedaCore();
        //    coreMoneda.MonedaInsert(nuevaMoneda);

        //}



        protected void grillaCotizacion_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grillaCotizacion.EditIndex = e.NewEditIndex;
            ((BoundField)grillaCotizacion.Columns[1]).ReadOnly = true;
            grillaCotizacion.DataBind();

        }


        protected void grillaCotizacion_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grillaCotizacion.EditIndex = -1;
            grillaCotizacion.DataBind();

        }

        protected void grillaCotizacion_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            MonedaEmpresaEntidad moneda = new MonedaEmpresaEntidad();
            GridViewRow row = grillaCotizacion.Rows[e.RowIndex];
            //var txt = (TextBox)row.Cells[1].FindControl("ID");
            //txt.ReadOnly = false;
            var IdMoneda = ((TextBox)row.Cells[1].Controls[0]).Text;
            var ISOCODE = ((TextBox)row.Cells[2].Controls[0]).Text;
            var cotizacion = ((TextBox)row.Cells[3].Controls[0]).Text;
            // var fechaCotizacion = ((TextBox)row.Cells[4].Controls[0]).Text;
            var simbolo = ((TextBox)row.Cells[4].Controls[0]).Text;

            //moneda.IdMoneda = Convert.ToInt32(IdMoneda);
            moneda.Cotizacion = Convert.ToDecimal(cotizacion);
            _managerMoneda.MonedaEmpresaUpdate(moneda);

            //////Reset the edit index.
            grillaCotizacion.EditIndex = -1;

            ////////Bind data to the GridView control.
            grillaCotizacion.DataBind();

            Response.Redirect(Request.RawUrl);

        }


        public class CotizacionDTO
        {
            public int IdMoneda { get; set; }
            public string Nombre { get; set; }
            public decimal Cotizacion { get; set; }
            public DateTime Fecha { get; set; }
            public string SimboloMoneda { get; set; }
            public string Url { get; set; }

        }
    }
}