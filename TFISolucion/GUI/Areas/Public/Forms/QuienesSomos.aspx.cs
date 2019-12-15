using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;
using TFI.CORE.Helpers;
using System.Configuration;
using System.Web.Services;

namespace TFI.GUI
{

    public partial class QuienesSomos : BasePage
    {
        private LenguajeEntidad idioma;
        public MonedaEmpresaEntidad cotizacion;
        public MonedaEntidad moneda;
        private MonedaCore _coreMoneda;

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
        public QuienesSomos()
        {
            idioma = new LenguajeEntidad();
            cotizacion = new MonedaEmpresaEntidad();
            moneda = new MonedaEntidad();
            _coreMoneda = new MonedaCore();
        }


        ////Para mantener la sesión activa
        //[WebMethod(EnableSession = true)]
        //public static void MantenerSesion()
        //{

        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            idioma = new LenguajeEntidad();

            EmpresaCore EmpresaBLL = new EmpresaCore();

            if (!IsPostBack)
            {

                idioma = (LenguajeEntidad)Session["Idioma"];

                if (idioma == null)
                {
                    idioma = new LenguajeEntidad();
                    idioma.DescripcionLenguaje = "es";
                    Session["Idioma"] = idioma;

                }
                cotizacion = new MonedaEmpresaEntidad();
                cotizacion = (MonedaEmpresaEntidad)Session["Cotizacion"];
                Session.Add("cotizacionAnterior", "");

            }
            else
            {
                cotizacion.IdMoneda = Convert.ToInt16(Master.obtenerValorDropDown());
                Session["Cotizacion"] = cotizacion;
                idioma.DescripcionLenguaje = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }
            if (cotizacion != null)
                moneda = _coreMoneda.selectMoneda(cotizacion.IdMoneda);
            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlLanguages");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.DescripcionLenguaje;

            }
            DropDownList lblStatus = FindControlFromMaster<DropDownList>("MonedaDRW");
            if (lblStatus != null)
                if (cotizacion != null)
                    lblStatus.SelectedValue = cotizacion.IdMoneda.ToString();

            nombreempresa.InnerHtml = EmpresaBLL.EmpresaSelectByCuit(ConfigSection.Default.Site.Cuit).NombreEmpresa;

            quienessomos.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "QuienesSomos", 1).Valor;

            mision.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "Mision", 1).Valor;

            vision.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "Vision", 1).Valor;

            TelEmpresa.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "TelEmpresa", 1).Valor;

            MailEmpresa.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "MailEmpresa", 1).Valor;

        }
    }
}