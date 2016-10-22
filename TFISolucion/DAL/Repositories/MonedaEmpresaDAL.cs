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
				new SqlParameter("@CUITEmpresa", monedaEmpresa.CUITEmpresa)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaInsert", parameters);
		}

		/// <summary>
		/// Deletes a record from the MonedaEmpresa table by its primary key.
		/// </summary>
		public void Delete(int idMoneda, int cUITEmpresa)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", idMoneda),
				new SqlParameter("@CUITEmpresa", cUITEmpresa)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the MonedaEmpresa table by a foreign key.
		/// </summary>
		public void DeleteAllByCUITEmpresa(int cUITEmpresa)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUITEmpresa", cUITEmpresa)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaDeleteAllByCUITEmpresa", parameters);
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
		public List<MonedaEmpresaEntidad> SelectAllByCUITEmpresa(int cUITEmpresa)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUITEmpresa", cUITEmpresa)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaEmpresaSelectAllByCUITEmpresa", parameters))
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
