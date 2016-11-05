using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.FUNCIONES;

namespace TFI.GUI
{
    public partial class Contacto : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void EnviarCorreo(object sender, EventArgs e)
        {
            Correo manager = new Correo();
            manager.EnviarCorreo("mhernanmartinez@gmail.com", "bestiasexual1984", txtNombre.Value, txtTelefono.Value, txtCorreo.Value, "MascoTrans", txtAsunto.Value, txtMensaje.Value);


        }
    }
}