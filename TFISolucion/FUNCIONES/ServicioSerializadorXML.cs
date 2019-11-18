using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace TFI.FUNCIONES
{
    public class ServicioSerializadorXML
    {
        public static Stream Serializar(object objeto)
        {
            BinaryFormatter xmlSerializer = new BinaryFormatter();

            System.IO.Stream ss = new System.IO.MemoryStream();

            xmlSerializer.Serialize(ss, objeto);

            return ss;
        }


        public static T DeSerializar<T>(Stream objetoEnXml) where T : new()
        {
            BinaryFormatter xmlSerializer = new BinaryFormatter();

            T resultado = (T)xmlSerializer.Deserialize(objetoEnXml);

            return resultado;

            
        }

        //public static Stream Serializar(object objeto)
        //{
        //    System.Xml.Serialization.XmlSerializer xmlSerializer = new System.Xml.Serialization.XmlSerializer(objeto.GetType());

        //    System.IO.Stream ss = new System.IO.MemoryStream();

        //    xmlSerializer.Serialize(ss, objeto);

        //    return ss;
        //}


        //public static T DeSerializar<T>(Stream objetoEnXml) where T : new()
        //{
        //    System.Xml.Serialization.XmlSerializer xmlSerializer = new System.Xml.Serialization.XmlSerializer(typeof(T));

        //    T resultado = (T)xmlSerializer.Deserialize(objetoEnXml);

        //    return resultado;


        //}

        public static string StreamAString(Stream ss)
        {
            byte[] bytes = new byte[System.Convert.ToInt32(ss.Length) + 1];

            ss.Position = 0;

            ss.Read(bytes, 0, System.Convert.ToInt32(ss.Length));

            return Encoding.ASCII.GetString(bytes);
        }

    }
}
