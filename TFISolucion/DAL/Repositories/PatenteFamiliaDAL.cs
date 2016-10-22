using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class PatenteFamiliaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the PatenteFamilia table.
		/// </summary>
		public void Insert(PatenteFamiliaEntidad patenteFamilia)
		{
			ValidationUtility.ValidateArgument("patenteFamilia", patenteFamilia);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", patenteFamilia.IdPatente),
				new SqlParameter("@IdFamilia", patenteFamilia.IdFamilia)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteFamiliaInsert", parameters);
		}

		/// <summary>
		/// Deletes a record from the PatenteFamilia table by its primary key.
		/// </summary>
		public void Delete(int idPatente, int idFamilia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", idPatente),
				new SqlParameter("@IdFamilia", idFamilia)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteFamiliaDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the PatenteFamilia table by a foreign key.
		/// </summary>
		public void DeleteAllByIdFamilia(int idFamilia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFamilia", idFamilia)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteFamiliaDeleteAllByIdFamilia", parameters);
		}

		/// <summary>
		/// Deletes a record from the PatenteFamilia table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPatente(int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", idPatente)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteFamiliaDeleteAllByIdPatente", parameters);
		}

		/// <summary>
		/// Selects all records from the PatenteFamilia table by a foreign key.
		/// </summary>
		public List<PatenteFamiliaEntidad> SelectAllByIdFamilia(int idFamilia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFamilia", idFamilia)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteFamiliaSelectAllByIdFamilia", parameters))
			{
				List<PatenteFamiliaEntidad> patenteFamiliaEntidadList = new List<PatenteFamiliaEntidad>();

                patenteFamiliaEntidadList = Mapeador.Mapear<PatenteFamiliaEntidad>(dt);

				return patenteFamiliaEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the PatenteFamilia table by a foreign key.
		/// </summary>
		public List<PatenteFamiliaEntidad> SelectAllByIdPatente(int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", idPatente)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteFamiliaSelectAllByIdPatente", parameters))
			{
				List<PatenteFamiliaEntidad> patenteFamiliaEntidadList = new List<PatenteFamiliaEntidad>();

                patenteFamiliaEntidadList = Mapeador.Mapear<PatenteFamiliaEntidad>(dt);

				return patenteFamiliaEntidadList;
			}
		}

		

		#endregion
	}
}
