using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class CondicionFiscalDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the CondicionFiscal table.
		/// </summary>
		public void Insert(CondicionFiscalEntidad condicionFiscal)
		{
			ValidationUtility.ValidateArgument("condicionFiscal", condicionFiscal);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Descripcion", condicionFiscal.Descripcion)
			};

			condicionFiscal.IdCondicionFiscal = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "CondicionFiscalInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the CondicionFiscal table.
		/// </summary>
		public void Update(CondicionFiscalEntidad condicionFiscal)
		{
			ValidationUtility.ValidateArgument("condicionFiscal", condicionFiscal);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCondicionFiscal", condicionFiscal.IdCondicionFiscal),
				new SqlParameter("@Descripcion", condicionFiscal.Descripcion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "CondicionFiscalUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the CondicionFiscal table by its primary key.
		/// </summary>
		public void Delete(int idCondicionFiscal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCondicionFiscal", idCondicionFiscal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "CondicionFiscalDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the CondicionFiscal table.
		/// </summary>
		public CondicionFiscalEntidad Select(int idCondicionFiscal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCondicionFiscal", idCondicionFiscal)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "CondicionFiscalSelect", parameters))
			{
                CondicionFiscalEntidad CondicionFiscalEntidad = new CondicionFiscalEntidad();

                CondicionFiscalEntidad = Mapeador.MapearFirst<CondicionFiscalEntidad>(dt);

                return CondicionFiscalEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the CondicionFiscal table.
		/// </summary>
		public List<CondicionFiscalEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "CondicionFiscalSelectAll"))
			{
				List<CondicionFiscalEntidad> condicionFiscalEntidadList = new List<CondicionFiscalEntidad>();

                condicionFiscalEntidadList = Mapeador.Mapear<CondicionFiscalEntidad>(dt);

				return condicionFiscalEntidadList;
			}
		}

		#endregion
	}
}
