using System.Collections.Generic;
using System.Linq;
using TFI.DAL.DAL;
using TFI.Entidades;
using TFI.CORE.Helpers;
using System.Web;
using System.Web.Services;
using System.Web.UI;

namespace TFI.CORE.Managers
{
    public class LenguajeCore
    {
        private LenguajeDAL _dal;
        private LenguajeControlDAL _dalControl;
        private List<object> ListaResultado = new List<object>();
        

        #region Constructor

        public LenguajeCore()
        {
            _dal = new LenguajeDAL();
            _dalControl = new LenguajeControlDAL();
        }

        #endregion Constructor

        public LenguajeEntidad Find(int id)
        {
            return _dal.Select(id);
        }

        public List<LenguajeEntidad> FindAll()
        {
            return _dal.SelectAll();
        }

        public LenguajeControlEntidad FindControl(int lenguajeID, string control)
        {
            return _dalControl.Select(control, lenguajeID,ConfigSection.Default.Site.Cuit);
        }

        public List<LenguajeControlEntidad> FindControlAll()
        {
            return _dalControl.SelectAll();
        }

        public List<LenguajeControlEntidad> FindControlsByLenguaje(int id)
        {
            return FindControlAll().Where(x => x.IdLenguaje == id).ToList();
        }



 public void Idioma(System.Web.UI.Page unformulario, int idioma)
{
	
     var listadetraducciones = FindControlsByLenguaje(idioma);

	ObtenerTodo(unformulario);


	try {

		foreach (Control Control in ListaResultado) {

			foreach (var traduccion_loopVariable in listadetraducciones) {
				
                var traduccion = traduccion_loopVariable;

				if (Equals(Control.ID, traduccion.Texto)) {

                    //ESTO SON LOS <a>
                  if ((Control) is System.Web.UI.HtmlControls.HtmlAnchor){

                        var mapeo = (System.Web.UI.HtmlControls.HtmlAnchor)Control;
                        mapeo.InnerText = traduccion.Valor;
                    }
                  //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                     else if ((Control) is System.Web.UI.HtmlControls.HtmlInputControl) {
     
                      var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
						mapeo.Value = traduccion.Valor;
                    }
                      //ESTOS SON LOS <BUTTON>
                  else if ((Control) is System.Web.UI.HtmlControls.HtmlButton)
                  {
                      var mapeo = (System.Web.UI.HtmlControls.HtmlButton)Control;
						mapeo.InnerText = traduccion.Valor;
                    }
                      //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                  else if ((Control) is System.Web.UI.HtmlControls.HtmlInputButton)
                  {
                      var mapeo = (System.Web.UI.HtmlControls.HtmlInputButton)Control;
					  mapeo.Value = traduccion.Valor;
                    }
                  else if ((Control) is System.Web.UI.HtmlControls.HtmlInputText)
                  {
                      var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
					  mapeo.Value = traduccion.Valor;
                    }

				}


			}



		}




	} catch {
	}



}

 public void ObtenerTodo(System.Web.UI.Page ElFormulario)
 {
     ListaResultado.Clear();

     ListaResultado.Add(ElFormulario);

     RecorrerContenedor(ElFormulario);


 }


 private void RecorrerContenedor(Control pObjetoContenedor)
 {
     foreach (Control Controlobj in pObjetoContenedor.Controls)
     {
         ListaResultado.Add(Controlobj);

         if ((Controlobj) is System.Web.UI.WebControls.DropDownList) {
             RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
         }
            

         if (Controlobj.Controls.Count > 0) { 
             RecorrerContenedor(Controlobj);
         }

         ListaResultado.Add(Controlobj);
     }
 }

 private void RecorrerDropDown(System.Web.UI.WebControls.DropDownList pMenuStrip)
 {
     ListaResultado.Add(pMenuStrip);
     foreach (System.Web.UI.WebControls.ListItem item in pMenuStrip.Items)
     {
         ListaResultado.Add(item);
     }


 }


    }
}