using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

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
		public void Delete(int idMoneda, int CUIT)
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
		public void DeleteAllByCUIT(int CUIT)
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
		public List<MonedaEmpresaEntidad> SelectAllByCUIT(int CUIT)
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

	

		#endregion
	}
}
