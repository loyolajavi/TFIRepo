using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace TFI.HelperDAL
{
    static class ValidationUtility
    {

            public static void ValidateArgument<T>(string name, T value) where T : new()
            {
                if (value == null)
                {
                    throw new ArgumentNullException(name);
                }
            }

            public static void ValidateArgument<T>(string name, T? value) where T : struct
            {
                if (!value.HasValue)
                {
                    throw new ArgumentNullException(name);
                }
            }

            public static void ValidateArgument(string name, string value)
            {
                if (value == null)
                {
                    throw new ArgumentNullException(name);
                }
            }

            public static void ValidateArgument(string name, string value, int minimumLength)
            {
                if (value == null)
                {
                    throw new ArgumentNullException(name);
                }
                if (value.Length < minimumLength)
                {
                    string message = string.Format("{0} must have at least {1} characters.", name, minimumLength);
                    throw new ArgumentException(message);
                }
            }

            public static bool IsNullOrEmpty(ICollection collection)
            {
                return collection == null || collection.Count == 0;
            }

            public static bool IsNullOrEmpty(DataSet dataSet)
            {
                return dataSet == null || dataSet.Tables.Count == 0;
            }

            public static bool IsNullOrEmpty(DataTable dataTable)
            {
                return dataTable == null || dataTable.Rows.Count == 0;
            }

            public static bool IsNullOrEmpty(SqlDataReader dataReader)
            {
                return dataReader == null || !dataReader.HasRows;
            }


    }
}
