using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;

namespace TFI.HelperDAL
{
    internal class Mapeador
    {
        public static List<T> Mapear<T>(DataTable table) where T : new()
        {
            IList<PropertyInfo> properties = typeof(T).GetProperties().ToList();
            List<T> result = new List<T>();

            foreach (var row in table.Rows)
            {
                var item = CreateItemFromRow<T>((DataRow)row, properties);
                result.Add(item);
            }

            return result;
        }

        public static T MapearFirst<T>(DataTable table) where T : new()
        {
            IList<PropertyInfo> properties = typeof(T).GetProperties().ToList();
            T result = new T();

            foreach (var row in table.Rows)
            {
                var item = CreateItemFromRow<T>((DataRow)row, properties);
                result = item;
            }

            return result;
        }

        private static T CreateItemFromRow<T>(DataRow row, IList<PropertyInfo> properties) where T : new()
        {
            T item = new T();

            foreach (var prop in properties)
            {
                if (prop.PropertyType.IsPrimitive
                    || typeof(String).IsAssignableFrom(prop.PropertyType)
                    || typeof(DateTime).IsAssignableFrom(prop.PropertyType)
                    || typeof(Decimal).IsAssignableFrom(prop.PropertyType))
                {
                    if (typeof(String).IsAssignableFrom(prop.PropertyType))
                    {
                        prop.SetValue(item, row[prop.Name].ToString(), null);
                    }
                    else
                    {
                        prop.SetValue(item, row[prop.Name], null);
                    }
                }
                else if (prop.PropertyType.BaseType.Name == "Enum")
                {
                    prop.SetValue(item, row[prop.Name], null);
                }
            }
            return item;
        }


        public static List<T> MapearAlt<T>(DataSet unDataSet) where T : new()
        {
            List<T> ListaResultado = Activator.CreateInstance<List<T>>();

            //CON ESTA LINEA ANDABA EL MAPEADOR
            //var Propiedades = typeof(T).GetProperties().ToList();
            //var Propiedades = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            Type unTipo = typeof(T);

            foreach (var row in unDataSet.Tables[0].Rows)
            {
                T Item = (T)CargarPropiedad(unTipo, (DataRow)row);
                ListaResultado.Add(Item);
            }

            return ListaResultado;
        }







        public static T MapearUnoAlt<T>(DataSet unDataSet) where T : new()
        {
            var Resultado = Activator.CreateInstance<T>();
            var Propiedades = Resultado.GetType().GetProperties();
            Type unTipo = typeof(T);

            foreach (var row in unDataSet.Tables[0].Rows)
            {
                Resultado = (T)CargarPropiedad(unTipo, (DataRow)row);
            }

            T result = (T)Convert.ChangeType(Resultado, typeof(T));
            return result;

            //return Resultado;
        }


        private static object CargarPropiedad(Type valType, DataRow row)
        {

            var unaInstancia = Activator.CreateInstance(valType);
            var properties = unaInstancia.GetType().GetProperties();

            foreach (var prop in properties)
            {
                Type unTipo = prop.PropertyType;
                try
                {

                    if (unTipo.IsClass && !typeof(String).IsAssignableFrom(unTipo))
                    {
                        if (unTipo.Name != "List`1")
                        {
                            prop.SetValue(unaInstancia, CargarPropiedad(unTipo, row), null);
                        }
                    }
                    else
                    {
                        prop.SetValue(unaInstancia, row[prop.Name], null);

                    }
                }
                catch (Exception es)
                {
                }
            }

            return unaInstancia;
        }


    }
}