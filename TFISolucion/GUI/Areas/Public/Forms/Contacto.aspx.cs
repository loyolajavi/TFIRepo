using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.FUNCIONES;

namespace TFI.GUI
{
    public partial class Contacto : BasePage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void EnviarCorreo(object sender, EventArgs e)
        {
            Correo manager = new Correo();
            manager.EnviarCorreo("martinez.juan.marcos@gmail.com", "descargas", txtNombre.Value, txtTelefono.Value, txtCorreo.Value, "MascoTrans", txtAsunto.Value, txtMensaje.Value);


        }
    }
}