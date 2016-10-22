using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.Entidades;

namespace TFI.GUI
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ESTO ERA UNA PRUEBA RAPIDA; NO RESPETABA LA DEPENDENCIA QUE TIENEN QUE TENER LAS CAPAS PORQUE IBA DE LA GUI A LA DAL
            //List<FormaPagoEntidad> unaFormaPago = new List<FormaPagoEntidad>();
            //TFI.DAL.DAL.FormaPagoDAL GestorFormaPago = new TFI.DAL.DAL.FormaPagoDAL();

            //unaFormaPago = GestorFormaPago.SelectAll();

            //TextBox1.Text = unaFormaPago.FirstOrDefault().DescripFormaPago;

            //UsuarioEntidad unUsuario = new UsuarioEntidad();

        }
    }
}