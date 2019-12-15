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
    public partial class ProductoAgregar : System.Web.UI.Page
    {
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        private LenguajeEntidad idioma;
        ProductoCore ManagerProducto = new ProductoCore();
        private EmpresaCore ManagerEmpresa = new EmpresaCore();
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
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

            string[] unosPermisosTest = new string[] { "ProductoAlta", "ProductoMod" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("/Areas/Public/Forms/Home.aspx");
            }

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
                CargarDropdown();
                Inicializar();
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

            


        }


        private void Inicializar()
        {
            var id = Request.QueryString["id"];

            if (!String.IsNullOrEmpty(id))
            {
                string[] unosPermisosTest = new string[] { "ProductoMod" };
                if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
                {
                    Response.Redirect("/Areas/Public/Forms/Home.aspx");
                }
                action.Value = "Edit";

                var p = ManagerProducto.Find(int.Parse(id), 1);
                productoId.Value = id;
                //precioAsp.Text = p.PrecioUnitario.ToString().Replace(",", ".");
                txtPrecio.Value = p.PrecioUnitario.ToString().Replace(",", ".");
                codigo.Value = p.CodigoProducto;
                descripcion.Value = p.DescripProducto;
                descriplarga.Value = p.DescripLarga;
                imagePath.Value = p.URL;
                //MARCA
                ddMarca.SelectedValue = p.miMarca.IdMarca.ToString();
                ddMarca.DataBind();
                //IVA
                ddiva.SelectedValue = p.miIvaProducto.IdIvaProducto.ToString();
                ddiva.DataBind();
            }
            else
            {
                string[] unosPermisosTest = new string[] { "ProductoAlta" };
                if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
                {
                    Response.Redirect("/Areas/Public/Forms/Home.aspx");
                }
            }
        }

        protected void CargarDropdown()
        {
            FillMarca();
            FillIVA();
        }

        protected void FillMarca()
        {
            ddMarca.DataSource = ManagerEmpresa.SeleccionarMarcas();
            ddMarca.DataValueField = "IdMarca";
            ddMarca.DataTextField = "DescripcionMarca";
            ddMarca.DataBind();
        }

        protected void FillIVA()
        {
            ddiva.DataSource = ManagerEmpresa.SeleccionarIvaProducto();
            ddiva.DataValueField = "IdIvaProducto";
            ddiva.DataTextField = "PorcentajeIvaProd";
            ddiva.DataBind();
        }

        protected void Guardar(object sender, EventArgs e)
        {
            bool success = false;

            bool validFile = urlProducto.HasFile && CanFileBeSaved();

            decimal pOut;

            //var precioConvertido = decimal.TryParse(precioAsp.Text, out pOut);
            var precioConvertido = decimal.TryParse(txtPrecio.Value, out pOut);

            if (precioConvertido)
            {
                //if (Convert.ToDecimal(precioAsp.Text) > 0)
                if (Convert.ToDecimal(txtPrecio.Value) > 0)
                {
                    if (productoId.Value == null || productoId.Value == "")
                    {
                        //NEW
                        ProductoEntidad p = new ProductoEntidad();
                        p.CodigoProducto = codigo.Value;
                        p.DescripProducto = descripcion.Value;
                        p.DescripLarga = descriplarga.Value;
                        p.miIvaProducto = new IvaProductoEntidad();
                        p.miIvaProducto.IdIvaProducto = int.Parse(ddiva.SelectedValue);
                        p.miMarca = new MarcaEntidad();
                        p.miMarca.IdMarca = int.Parse(ddMarca.SelectedValue);
                        //p.PrecioUnitario = Convert.ToDecimal(precioAsp.Text.Replace(".", ","));
                        p.PrecioUnitario = Convert.ToDecimal(txtPrecio.Value.Replace(".", ","));
                        p.CUIT = ConfigSection.Default.Site.Cuit;
                        p.URL = SaveFile() ? urlProducto.FileName : "default.jpg";

                        ManagerProducto.ProductoInsert(p);
                        success = true;
                    }
                    else
                    {
                        var old = ManagerProducto.Find(int.Parse(productoId.Value), 1);

                        //EDIT
                        old.CodigoProducto = codigo.Value;
                        old.DescripProducto = descripcion.Value;
                        old.DescripLarga = descriplarga.Value;
                        old.miIvaProducto.IdIvaProducto = int.Parse(ddiva.SelectedValue);
                        old.miMarca.IdMarca = int.Parse(ddMarca.SelectedValue);
                        //old.PrecioUnitario = Convert.ToDecimal(precioAsp.Text.Replace(".", ","));
                        old.PrecioUnitario = Convert.ToDecimal(txtPrecio.Value.Replace(".", ","));
                        old.CUIT = ConfigSection.Default.Site.Cuit;

                        if (urlProducto.HasFile)
                        {
                            old.URL = urlProducto.FileName;
                            SaveFile();
                        }

                        ManagerProducto.ProductoUpdate(old);
                        success = true;
                    }
                }
            }
            if (success)
            {
                Response.Redirect("/Areas/Intranet/Forms/GestionContenidoProductos.aspx");
            }
        }

        private bool CanFileBeSaved()
        {
            bool can = false;

            String path = Server.MapPath("~/Content/Images/Productos/");
            String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
            String fileExtension = System.IO.Path.GetExtension(urlProducto.FileName).ToLower();

            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                    can = true;
            }

            return can;
        }

        private bool SaveFile()
        {
            bool wasSaved = false;

            if (IsPostBack)
            {
                Boolean fileOK = false;
                String path = Server.MapPath("~/Content/Images/Productos/");
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

                if (urlProducto.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(urlProducto.FileName).ToLower();

                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    urlProducto.PostedFile.SaveAs(path + urlProducto.FileName);
                    wasSaved = true;
                }
            }
            return wasSaved;
        }





    }
}