using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace TFI.FUNCIONES
{
    public static class Encriptacion
    {
        public static string ToHash(string clave)
        {
            if (string.IsNullOrEmpty(clave))
                return "";

            var provider = new SHA1CryptoServiceProvider();
            var encoding = new UnicodeEncoding();
            return Convert.ToBase64String(provider.ComputeHash(encoding.GetBytes(clave)));
        }

    }
}
