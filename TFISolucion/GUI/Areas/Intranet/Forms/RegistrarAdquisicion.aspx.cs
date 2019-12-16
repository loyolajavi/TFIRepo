using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;
using TFI.SEGURIDAD;
using System.IO;
using TFI.CORE.Managers;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class RegistrarAdquisicion : BasePage    
    {
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        ProductoCore ManagerProducto = new ProductoCore();
        StockCore ManagerStock = new StockCore();
        SucursalCore ManagerSucursal = new SucursalCore();
        Adquisicion unaAdquisicion = new Adquisicion();
        HttpContext Current = HttpContext.Current;


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

            string[] unosPermisosTest = new string[] { "AdquisicionRegistrar" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }

            if (!IsPostBack)
            {
                CargarSucursales();
            }
            else
            {
                if (Current.Session["AdqEnTramite"] != null)
                    unaAdquisicion = (Adquisicion)Current.Session["AdqEnTramite"];
            }
         
        }


        private void CargarSucursales()
        {
            cboSucursal.DataSource = ManagerSucursal.FindAll();
            cboSucursal.DataValueField = "IdSucursal";
            cboSucursal.DataTextField = "DescripSucursal";
            cboSucursal.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            List<ProductoEntidad> unosProd = new List<ProductoEntidad>();
            ProductoEntidad unProducto;
            List<AdqDetalleDTO> unosAdqDetallesDTO = new List<AdqDetalleDTO>();

            int cant; 
            if(!string.IsNullOrWhiteSpace(txtProd.Text))
                unosProd = ManagerProducto.FindAllByDescripProducto(txtProd.Text);
            if (unosProd != null && unosProd.Count > 0 && !string.IsNullOrWhiteSpace(txtCant.Value))
            {
                unProducto = unosProd.First();
                cant = Int32.Parse(txtCant.Value);

                if (unaAdquisicion.MisAdqDetalles.Any(X => X.miProducto.IdProducto == unProducto.IdProducto))
                    unaAdquisicion.MisAdqDetalles.First(X => X.miProducto.IdProducto == unProducto.IdProducto).Cantidad += cant;
                else
                    unaAdquisicion.AgregarDetalle(unProducto, cant);

                foreach (AdquisicionDetalle item in unaAdquisicion.MisAdqDetalles)
                {
                    unosAdqDetallesDTO.Add(new AdqDetalleDTO(item.miProducto.IdProducto, item.miProducto.DescripProducto, item.Cantidad));
                }

                grillaDetallesAdq.DataSource = null;
                grillaDetallesAdq.DataSource = unosAdqDetallesDTO;
                grillaDetallesAdq.DataBind();

                Current.Session["AdqEnTramite"] = unaAdquisicion;
            }
        }
        
        

            private class AdqDetalleDTO
            {
                public AdqDetalleDTO(int elIdProducto, string elDescripProducto, int laCantidad)
                {
                    IdProducto = elIdProducto;
                    DescripProducto = elDescripProducto;
                    Cantidad = laCantidad;
                }

                public int IdProducto { get; set; }
                public string DescripProducto { get; set; }
                public int Cantidad { get; set; }
            }

            protected void btnRegistrar_Click(object sender, EventArgs e)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                if (!string.IsNullOrWhiteSpace(txtRemito.Value) && !string.IsNullOrWhiteSpace(elIdFechaInicio.Value) && unaAdquisicion.MisAdqDetalles != null && unaAdquisicion.MisAdqDetalles.Count > 0)
                {
                    unaAdquisicion.CUIT = CORE.Helpers.ConfigSection.Default.Site.Cuit;
                    unaAdquisicion.miSucursal = new SucursalEntidad();
                    unaAdquisicion.miSucursal.IdSucursal = Int32.Parse(cboSucursal.SelectedValue);
                    unaAdquisicion.NroRemito = txtRemito.Value;
                    unaAdquisicion.miFecha = DateTime.Parse(elIdFechaInicio.Value);

                    AdquisicionCore ManagerAdq = new AdquisicionCore();
                    ManagerAdq.Create(unaAdquisicion);

                    grillaDetallesAdq.DataSource = null;
                    grillaDetallesAdq.DataBind();

                    unaAdquisicion = null;
                    Current.Session["AdqEnTramite"] = unaAdquisicion;
                    txtRemito.Value = "";
                    elIdFechaInicio.Value = "";
                    txtProd.Text = "";
                    txtCant.Value = "";

                    sb.Append("alert('Adquisición creada correctamente');");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               UniqueID, sb.ToString(), true);
                }
            }

        
    }
}