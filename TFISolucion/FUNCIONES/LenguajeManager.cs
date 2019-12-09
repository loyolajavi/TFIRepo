using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace TFI.FUNCIONES
{
    public class LenguajeManager
    {

        public static IDictionary<string, string> UpdateDiccionario(string language)
        {
            var diccionario = new Dictionary<string, string>();

        //    var leng = FindByLenguage(language)
        //                    .ToDictionary(key => key.Control,
        //                                  val => val.Value);

        //    if (leng.Any())
        //    {
        //        diccionario = leng;
        //    }

            return diccionario;
        }

        //private static IEnumerable<Entidades.LenguajeEntidad> FindByLenguage(string lenguage)
        //{
        //    var language = new List<Entidades.LenguajeEntidad>();

        //    //MAPPER.QUERY.SELECTALLL

        //    //MOCK EJEMPLO
        //    language.Add(new Entidades.LenguajeEntidad
        //    {
        //        Control = "Nombre",
        //        IsoCode = "en",
        //        Value = "Name"
        //    });

        //    language.Add(new Entidades.LenguajeEntidad
        //    {
        //        Control = "Nombre",
        //        IsoCode = "es",
        //        Value = "Nombre"
        //    });

        //    return language
        //                .Where(x => x.IsoCode == lenguage);
        //}


    }
}
