using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class PatenteDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Patente table.
		/// </summary>
		public void Insert(PatenteEntidad patente)
		{
			ValidationUtility.ValidateArgument("patente", patente);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NombrePatente", patente.NombrePatente)
			};

            patente.IdPatente = (int)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Patente table.
		/// </summary>
		public void Update(PatenteEntidad patente)
		{
			ValidationUtility.ValidateArgument("patente", patente);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", patente.IdPatente),
				new SqlParameter("@NombrePatente", patente.NombrePatente)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Patente table by its primary key.
		/// </summary>
		public void Delete(int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", idPatente)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the Patente table.
		/// </summary>
		public PatenteEntidad Select(int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", idPatente)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteSelect", parameters))
			{
                PatenteEntidad PatenteEntidad = new PatenteEntidad();

                PatenteEntidad = Mapeador.MapearFirst<PatenteEntidad>(dt);

                return PatenteEntidad;
			}
		}



		/// <summary>
		/// Selects all records from the Patente table.
		/// </summary>
		public List<PatenteEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatenteSelectAll"))
			{
				List<PatenteEntidad> patenteEntidadList = new List<PatenteEntidad>();

                patenteEntidadList = Mapeador.Mapear<PatenteEntidad>(dt);

				return patenteEntidadList;
			}
		}



		#endregion
	}
}
