using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TFI.CORE.Managers;
using TFI.Entidades;

namespace TFI.GUI.Areas.Intranet.Forms
{
    public partial class Reportes : System.Web.UI.Page
    {
        private ReporteCore managerReportes = new ReporteCore();
        UsuarioEntidad usuarioentidad = new UsuarioEntidad();

        protected void Page_Load(object sender, EventArgs e)
        {
     
        }

        protected void btnReportePxF_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + "Pedidos" + " " + DateTime.Now + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite( managerReportes.ReportePedidosPorFechayEstado());
            Response.End();
        }

        protected void btnReportePxU_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text != "") { 
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + "Pedidos del usuario" + " " + txtUsuario.Text + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(managerReportes.ReportePedidosDeUsuario(txtUsuario.Text));
            Response.End();
            }
        }
    }
}