using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using TFI.Entidades;

namespace TFI.GUI
{
    public class BasePage : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {

            var language = (LenguajeEntidad)HttpContext.Current.Session["Idioma"];
            //string language = "es";
            if (language==null)
            {
                language = new LenguajeEntidad();
                language.DescripcionLenguaje = "es";
            }
            //Detect User's Language.
            //if (Request.UserLanguages != null)
            //{
            //    //Set the Language.
            //    //language.DescripcionLenguaje = Request.UserLanguages[0];
            //}

            //Check if PostBack is caused by Language DropDownList.
            if (Request.Form["__EVENTTARGET"] != null && Request.Form["__EVENTTARGET"].Contains("ddlLanguages"))
            {
                //Set the Language.
                language.DescripcionLenguaje = Request.Form[Request.Form["__EVENTTARGET"]];
            }

            //Set the Culture.
            Thread.CurrentThread.CurrentCulture = new CultureInfo(language.DescripcionLenguaje);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language.DescripcionLenguaje);
        }
    }
}