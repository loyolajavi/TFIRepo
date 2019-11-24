using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class MonedaEmpresaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the MonedaEmpresa table.
		/// </summary>
		public void Insert(MonedaEmpresaEntidad monedaEmpresa)
		{
			ValidationUtility.ValidateArgument("monedaEmpresa", monedaEmpresa);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", monedaEmpresa.IdMoneda),
				new SqlParameter("@CUIT", monedaEmpresa.CUIT)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaInsert", parameters);
		}

		/// <summary>
		/// Deletes a record from the MonedaEmpresa table by its primary key.
		/// </summary>
		public void Delete(int idMoneda, string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", idMoneda),
				new SqlParameter("@CUIT", CUIT)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the MonedaEmpresa table by a foreign key.
		/// </summary>
		public void DeleteAllByCUIT(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaDeleteAllByCUIT", parameters);
		}

		/// <summary>
		/// Deletes a record from the MonedaEmpresa table by a foreign key.
		/// </summary>
		public void DeleteAllByIdMoneda(int idMoneda)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", idMoneda)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaDeleteAllByIdMoneda", parameters);
		}


		/// <summary>
		/// Selects all records from the MonedaEmpresa table by a foreign key.
		/// </summary>
		public List<MonedaEmpresaEntidad> SelectAllByCUIT(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaSelectAllByCUIT", parameters))
			{
				List<MonedaEmpresaEntidad> monedaEmpresaEntidadList = new List<MonedaEmpresaEntidad>();

                monedaEmpresaEntidadList = Mapeador.Mapear<MonedaEmpresaEntidad>(dt);

				return monedaEmpresaEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the MonedaEmpresa table by a foreign key.
		/// </summary>
		public List<MonedaEmpresaEntidad> SelectAllByIdMoneda(int idMoneda)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", idMoneda)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaSelectAllByIdMoneda", parameters))
			{
				List<MonedaEmpresaEntidad> monedaEmpresaEntidadList = new List<MonedaEmpresaEntidad>();

                monedaEmpresaEntidadList = Mapeador.Mapear<MonedaEmpresaEntidad>(dt);

				return monedaEmpresaEntidadList;
			}
		}


        public MonedaEmpresaEntidad Select(int idMoneda, string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdMoneda", idMoneda),
                new SqlParameter("@CUIT", CUIT)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaSelect", parameters))
            {
                MonedaEmpresaEntidad MonedaEntidad = new MonedaEmpresaEntidad();

                MonedaEntidad = Mapeador.MapearFirst<MonedaEmpresaEntidad>(dt);

                return MonedaEntidad;
            }
        }

        public void Update(MonedaEmpresaEntidad monedaEmpresa)
        {
            ValidationUtility.ValidateArgument("monedaEmpresa", monedaEmpresa);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdMoneda", monedaEmpresa.IdMoneda),
                new SqlParameter("@CUIT", monedaEmpresa.CUIT),
                new SqlParameter("@Cotizacion",monedaEmpresa.Cotizacion )
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaUpdate", parameters);
        }


        #endregion
    }
}
