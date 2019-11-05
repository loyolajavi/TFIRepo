using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TFI.SEGURIDAD;

namespace TFI.FUNCIONES
{
    public class ServicioMail
    {

        public static int Puerto { get; set; }
        public static string Host { get; set; }
        public static bool ssl { get; set; }
        public static string remitente { get; set; }
        public static string remps { get; set; }

        private static bool EnvioExitoso;

        public static bool EnviarCorreo
            (
                string destinatario,
                string nombreEmpresa,
                string asunto,
                string cuerpoCorreo
            )
        {
            try
            {
                var serverSMTP = new SmtpClient();
                NetworkCredential credencial = new NetworkCredential();
                credencial.UserName = remitente;
                credencial.SecurePassword = ServicioSecurizacion.SecurizarMailPass(remps);
                serverSMTP.Credentials = credencial;
                serverSMTP.Port = Puerto;
                serverSMTP.Host = Host;
                var correo = new MailMessage();
                correo.From = new MailAddress(remitente, nombreEmpresa);
                correo.To.Add(destinatario);
                correo.Subject = asunto;
                correo.Body = cuerpoCorreo;
                serverSMTP.EnableSsl = ssl;

                Thread ProcesoMailEnviar = new Thread
                    (delegate()
                    {
                        try
                        {
                            serverSMTP.Send(correo);
                            EnvioExitoso = true;
                        }
                        catch (Exception ex)
                        {
                            throw;
                        }
                        finally
                        {
                            correo.Dispose();
                        }
                    }
                    );

                ProcesoMailEnviar.Start();
                return EnvioExitoso;
            }
            catch (Exception es)
            {
                throw;
            }
        }






    }
}
