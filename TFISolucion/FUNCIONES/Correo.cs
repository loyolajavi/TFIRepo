using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace TFI.FUNCIONES
{
    public class Correo
    {
        public void EnviarCorreo(string remitente, string contrasenia, string nombre, string telefono, string destinatario, string nombreEmpresa, string asunto, string cuerpoCorreo)
        {
            var serverSMTP = new SmtpClient();
            NetworkCredential credencial = new NetworkCredential(remitente, contrasenia);
            serverSMTP.Credentials = credencial;
            serverSMTP.Port = 587;
            serverSMTP.Host = "smtp.gmail.com";
            var correo = new MailMessage();
            correo.From = new MailAddress(remitente, nombreEmpresa);
            correo.To.Add(destinatario);
            correo.Subject = asunto;
            correo.Body = cuerpoCorreo;
            serverSMTP.EnableSsl = true;
            serverSMTP.Send(correo);

        }
    }
}
