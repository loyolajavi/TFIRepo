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
        SucursalCore ManagerSucursal = new SucursalCore();
        List<SucursalEntidad> unasSucursales = new List<SucursalEntidad>();

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
                grillastock.DataSource = Consultas;
                grillastock.AutoGenerateColumns = false;

                if (!IsPostBack) { grillastock.DataBind(); }
            }

            if (!IsPostBack) 
            { 
                //CargarDropdownProductos();
                CargarSucursales();
            }
        }

        //private void CargarDropdownProductos()
        //{
        //    ddlProducto.DataSource = ProductoBLL.FindAllByCUIT(1);
        //    ddlProducto.DataValueField = "IdProducto";
        //    ddlProducto.DataTextField = "DescripProducto";
        //    ddlProducto.DataBind();
        //}

        private void CargarSucursales()
        {
            unasSucursales = ManagerSucursal.FindAll();
            SucursalEntidad unaSuc = new SucursalEntidad();
            unaSuc.IdSucursal = -1;
            unaSuc.DescripSucursal = "";
            unasSucursales.Insert(0, unaSuc);
            cboSucursal.Items.Clear();
            cboSucursal.DataSource = null;
            cboSucursal.DataSource = unasSucursales;
            cboSucursal.DataValueField = "IdSucursal";
            cboSucursal.DataTextField = "DescripSucursal";
            cboSucursal.DataBind();
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

            ProductoEntidad unProducto;
            List<ProductoEntidad> productos;
            if(!string.IsNullOrWhiteSpace(txtProductoaBuscar.Text))
                productos = ProductoBLL.FindAllByDescripProducto(txtProductoaBuscar.Text);
            else
                return;

            if (productos != null && productos.Count > 0)
            {
                unProducto = (ProductoEntidad)productos.First();

                //StockSucursalEntidad unStock = StockBLL1.Select(item.miProducto.IdProducto, laAdquisicion.miSucursal.IdSucursal, laAdquisicion.CUIT);

                List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
                StockDeProducto = StockBLL1.SelectByIdProducto(unProducto.IdProducto);

                ConsultaDTO Consulta = new ConsultaDTO();
                Consulta.IdProducto = unProducto.IdProducto;
                Consulta.Descripcion = unProducto.DescripProducto;
                if (StockDeProducto.Count > 0)
                {
                    if(Int32.Parse(cboSucursal.SelectedValue) < 0) //Si no se indica sucursal se muestra stock total
                    {
                        hIdSuc.Value = "";
                        hIdProd.Value = "";
                        foreach (StockSucursalEntidad unProdSucStock in StockDeProducto)
                        {
                            Consulta.CantidadEnStock += unProdSucStock.CantidadProducto;
                        }
                    }
                    else //Se indica sucursal y se muestra el sucursal en la misma
                    {
                        if(StockDeProducto.Exists(X=>X.IdSucursal == Int32.Parse(cboSucursal.SelectedValue) && X.IdProducto == unProducto.IdProducto))
                        {
                            hIdSuc.Value = cboSucursal.SelectedValue;
                            hIdProd.Value = unProducto.IdProducto.ToString();
                            StockSucursalEntidad unProdSucStock = StockDeProducto.First(X=>X.IdSucursal == Int32.Parse(cboSucursal.SelectedValue) && X.IdProducto == unProducto.IdProducto);
                            Consulta.CantidadEnStock = unProdSucStock.CantidadProducto;
                        }
                    }
                }
                else
                {
                    SucursalCore coreSucursal = new SucursalCore();
                    var listSucursales = coreSucursal.FindAll();

                    StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
                    NuevoStock.IdProducto = unProducto.IdProducto;
                    NuevoStock.CantidadProducto = 0;
                    NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
                    NuevoStock.IdSucursal = listSucursales[0].IdSucursal; ;

                    StockCore StockBLL = new StockCore();
                    StockBLL.Insert(NuevoStock);

                    Consulta.CantidadEnStock = 0;
                }

                Consultas.Add(Consulta);
                CargarGrillaStock();
            }
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static bool AjustarStock(int IdSuc, int IdProd, int IdAdq, int ajuste)
        {
            var usuarioEntity = new UsuarioEntidad();
            var Current = HttpContext.Current;

            usuarioEntity = (UsuarioEntidad)Current.Session["Usuario"];

            Adquisicion unaAdqAjuste = new Adquisicion();
            AdquisicionCore ManagerAdquisicion = new AdquisicionCore();
            int IdAdqDetalle = 0;
            if(IdSuc > 0 && IdProd > 0 && IdAdq > 0)
                IdAdqDetalle = ManagerAdquisicion.ObtenerIDAdqByIdSucIdProdIdAdq(IdAdq, IdSuc, IdProd);
            if(IdAdqDetalle > 0)
            {
                unaAdqAjuste.IdAdquisicion = IdAdq;
                unaAdqAjuste.miSucursal = new SucursalEntidad();
                unaAdqAjuste.miSucursal.IdSucursal = IdSuc;
                unaAdqAjuste.CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit;
                ProductoEntidad unProdAux = new ProductoEntidad();
                unProdAux.IdProducto = IdProd;
                unaAdqAjuste.AgregarDetalle(unProdAux, 0, ajuste);
                unaAdqAjuste.MisAdqDetalles.First().IdAdquisicionDetalle = IdAdqDetalle;
                ManagerAdquisicion.AjustarStock(unaAdqAjuste);
                return true;
            }
            return false;
            //StockSucursalEntidad NuevoStock = new StockSucursalEntidad();
            //NuevoStock.IdProducto = IdProd;
            //NuevoStock.CUIT = ConfigSection.Default.Site.Cuit;
            //NuevoStock.IdSucursal = IdSuc;
            //NuevoStock.CantidadProducto = ajuste;

            //StockCore StockBLL = new StockCore();

            //List<StockSucursalEntidad> StockDeProducto = new List<StockSucursalEntidad>();
            //StockDeProducto = StockBLL.SelectByIdProducto(NuevoStock.IdProducto);



            //if (StockDeProducto.Count > 0)
            //{
            //    if (stock < 0)
            //    {
            //        int debesermayora0;
            //        debesermayora0 = StockDeProducto[0].CantidadProducto + stock;
            //        if (debesermayora0 >= 0)
            //        {
            //            NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + stock;
            //            StockBLL.Update(NuevoStock);
            //        }
            //    }
            //    else
            //    {
            //        NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + stock;
            //        StockBLL.Update(NuevoStock);
            //    }
            //}
            //else
            //{
            //    if (stock < 0)
            //    {
            //        int debesermayora0;
            //        debesermayora0 = StockDeProducto[0].CantidadProducto + stock;
            //        if (debesermayora0 >= 0)
            //        {
            //            NuevoStock.CantidadProducto = StockDeProducto[0].CantidadProducto + stock;
            //            StockBLL.Insert(NuevoStock);
            //        }
            //        else
            //        {
            //            StockBLL.Insert(NuevoStock);
            //        }
            //    }
            //}
        
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