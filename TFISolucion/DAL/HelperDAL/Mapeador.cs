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
    }
}