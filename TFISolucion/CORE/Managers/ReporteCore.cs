using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TFI.DAL.DAL;
using TFI.DAL.Repositories;
using TFI.Entidades;

namespace TFI.CORE.Managers
{
   public class ReporteCore
    {
       public byte[] GetPDF(string pHTML,string titulo)
       {
           byte[] bPDF = null;

           MemoryStream ms = new MemoryStream();
           TextReader txtReader = new StringReader(pHTML);

           // 1: create object of a itextsharp document class
           Document doc = new Document(PageSize.A4, 25, 25, 25, 25);
           doc.AddTitle(titulo);
           

           // 2: we create a itextsharp pdfwriter that listens to the document and directs a XML-stream to a file
           PdfWriter oPdfWriter = PdfWriter.GetInstance(doc, ms);

           // 3: we create a worker parse the document
           HTMLWorker htmlWorker = new HTMLWorker(doc);

           // 4: we open document and start the worker on the document
           doc.Open();
           htmlWorker.StartDocument();

           // 5: parse the html into the document
           htmlWorker.Parse(txtReader);

           // 6: close the document and the worker
           htmlWorker.EndDocument();
           htmlWorker.Close();
           doc.Close();

           bPDF = ms.ToArray();

           return bPDF;
       }

       private ReporteDAL DalReporte = new ReporteDAL();

       public byte[] ReportePedidosPorFechayEstado()
       {
          List<ReportePedidosPorFechayEstado> items =  DalReporte.ReportePedidosPorFechayEstado(Helpers.ConfigSection.Default.Site.Cuit);

           string HTMLContent = "<table><tr><th>Fecha</th><th>Pedido</th><th>Usuario</th><th>Estado</th></tr>";

           foreach (var item in items)
           {
               HTMLContent += "<tr><td>" + item.Fecha + "</td><td>" + item.Pedido + "</td><td>" + item.Usuario + "</td><td>" + item.Estado + "</td></tr>";
           }

           HTMLContent = HTMLContent + "</table>";

          return GetPDF(HTMLContent,"Reporte de pedidos por fecha y estado");
       }

       public byte[] ReportePedidosDeUsuario(string usuario)
       {
           List<ReportePedidosDeUsuario> items = DalReporte.ReportePedidosDeUsuario(Helpers.ConfigSection.Default.Site.Cuit,usuario);

           string HTMLContent = "<table><tr><th>Fecha</th><th>Pedido</th><th>Estado</th></tr>";

           foreach (var item in items)
           {
               HTMLContent += "<tr><td>" + item.Fecha + "</td><td>" + item.Pedido + "</td><td>" + item.Estado + "</td></tr>";
           }

           HTMLContent = HTMLContent + "</table>";

           return GetPDF(HTMLContent, "Reporte de pedidos por Usuario");
       }
    }
}
