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
    public partial class GestionContenidoQuienesSomos : System.Web.UI.Page
    {

        EmpresaCore EmpresaBLL = new EmpresaCore();

        protected void Page_Load(object sender, EventArgs e)
        {

            NombreEmpresa.Value = EmpresaBLL.EmpresaSelectByCuit(ConfigSection.Default.Site.Cuit).NombreEmpresa;

            QuienesSomos.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "QuienesSomos", 1).Valor;

            Mision.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "Mision", 1).Valor;

            Vision.InnerHtml = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "Vision", 1).Valor;

            TelefonoEmpresa.Value = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "TelEmpresa", 1).Valor;

            MailEmpresa.Value = EmpresaBLL.SeleccionarContenidoEmpresa(ConfigSection.Default.Site.Cuit, "MailEmpresa", 1).Valor;

        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> ElementosaActualizar = new Dictionary<string, string>();
            ElementosaActualizar.Add("QuienesSomos", QuienesSomos.Value);
            ElementosaActualizar.Add("Mision", Mision.Value);
            ElementosaActualizar.Add("Vision", Vision.Value);
            ElementosaActualizar.Add("TelEmpresa", TelefonoEmpresa.Value);
            ElementosaActualizar.Add("MailEmpresa", MailEmpresa.Value);

            foreach (var elemento in ElementosaActualizar)
            {

                LenguajeControlEntidad ElementoActualizado = new LenguajeControlEntidad();
                ElementoActualizado.CUIT = ConfigSection.Default.Site.Cuit;
                ElementoActualizado.IdLenguaje = 1;
                ElementoActualizado.Texto = elemento.Key;
                ElementoActualizado.Valor = elemento.Value;

                EmpresaBLL.ActualizarContenidoEmpresa(ElementoActualizado);

            }

            Response.Redirect(Request.RawUrl);

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod]
        public static void ActualizarContenidoQuienesSomos(string NombreEmpresa, string TelefonoEmpresa, string MailEmpresa, string QuienesSomos, string Mision, string Vision)
        {
            var MiEmpresaBLL = new EmpresaCore();

            Dictionary<string, string> ElementosaActualizar = new Dictionary<string, string>();
            ElementosaActualizar.Add("NombreEmpresa", NombreEmpresa);
            ElementosaActualizar.Add("QuienesSomos", QuienesSomos);
            ElementosaActualizar.Add("Mision", Mision);
            ElementosaActualizar.Add("Vision", Vision);
            ElementosaActualizar.Add("TelEmpresa", TelefonoEmpresa);
            ElementosaActualizar.Add("MailEmpresa", MailEmpresa);

            foreach (var elemento in ElementosaActualizar)
            {

                LenguajeControlEntidad ElementoActualizado = new LenguajeControlEntidad();
                ElementoActualizado.CUIT = ConfigSection.Default.Site.Cuit;
                ElementoActualizado.IdLenguaje = 1;
                ElementoActualizado.Texto = elemento.Key;
                ElementoActualizado.Valor = elemento.Value;

                MiEmpresaBLL.ActualizarContenidoEmpresa(ElementoActualizado);

            }



        }

    }
}