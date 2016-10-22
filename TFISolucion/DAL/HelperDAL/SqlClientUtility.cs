using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TFI.HelperDAL
{
        internal static class SqlClientUtility
        {
            public static string connectionStringName
            {
                get { return _connectionStringName; }
                internal set { }
            }

            private static string _connectionStringName = ConfigurationManager.ConnectionStrings["DataContext"].ConnectionString;
            private static SqlTransaction tr;
            private static SqlCommand command;
            private static SqlConnection connection;

            public static DataTable ExecuteDataTable(string connectionStringName, CommandType commandType, string commandText, params SqlParameter[] parameters)
            {
                DataTable result;

                try
                {
                    //si este codigo queda por las dudas.
                    connection = new SqlConnection(connectionStringName);

                    if (connection != null && connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }

                    tr = connection.BeginTransaction();

                    using (command = CreateCommand(connection, commandType, commandText, parameters))
                    {
                        //TRANSACCIONES
                        result = CreateDataTable(command);
                        tr.Commit();
                        return result;
                    }
                }
                catch (Exception)
                {
                    tr.Rollback();
                    throw;
                }
                finally
                {
                    connection.Close();
                }
            }

            private static SqlCommand CreateCommand(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] parameters)
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = commandText;
                command.CommandType = commandType;
                command.Transaction = tr;

                if (parameters.Length != 0)
                {
                    for (int i = 0; i < parameters.Length; i++)
                    {
                        SqlParameter parameter = parameters[i];
                        parameter.Value = ChequearNulo(parameter.Value);
                        command.Parameters.Add(parameter);
                    }
                }
                return command;
            }

            private static DataTable CreateDataTable(SqlCommand command)
            {
                DataTable result;
                using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                {
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);
                    result = dataTable;
                }
                return result;
            }

            private static object ChequearNulo(object value)
            {
                object result;
                if (value == null)
                {
                    result = DBNull.Value;
                }
                else
                {
                    result = value;
                }
                return result;
            }

            public static void ExecuteNonQuery(string connectionStringName, CommandType commandType, string commandText, params SqlParameter[] parameters)
            {
                try
                {
                    connection = new SqlConnection(connectionStringName);

                    connection.Open();

                    tr = connection.BeginTransaction();

                    using (command = CreateCommand(connection, commandType, commandText, parameters))
                    {
                        command.ExecuteNonQuery();
                        tr.Commit();
                    }
                }
                catch (Exception)
                {
                    tr.Rollback();
                    throw;
                }
                finally
                {
                    connection.Close();
                }
            }

            public static object ExecuteScalar(string connectionStringName, CommandType commandType, string commandText, params SqlParameter[] parameters)
            {
                object result;

                try
                {
                    connection = new SqlConnection(connectionStringName);

                    connection.Open();

                    tr = connection.BeginTransaction();

                    using (command = CreateCommand(connection, commandType, commandText, parameters))
                    {
                        result = command.ExecuteScalar();
                        tr.Commit();
                        return result;
                    }
                }
                catch (Exception)
                {
                    tr.Rollback();
                    throw;
                }
                finally
                {
                    connection.Close();
                }
            }
        }
}
