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

namespace TFI.GUI
{
    public partial class QuienesSomos : BasePage
    {



        protected void Page_Load(object sender, EventArgs e)
        {

            EmpresaCore EmpresaBLL = new EmpresaCore();


            nombreempresa.InnerHtml = EmpresaBLL.EmpresaSelectByCuit(ConfigSection.Default.Site.Cuit).NombreEmpresa;

            quienessomos.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "QuienesSomos", 1).Valor;

            mision.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "Mision", 1).Valor;

            vision.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "Vision", 1).Valor;

            TelEmpresa.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "TelEmpresa", 1).Valor;

            MailEmpresa.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "MailEmpresa", 1).Valor;

        }
    }
}