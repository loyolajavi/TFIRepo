using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class LenguajeDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Lenguaje table.
		/// </summary>
		public void Insert(LenguajeEntidad lenguaje)
		{
			ValidationUtility.ValidateArgument("lenguaje", lenguaje);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripcionLenguaje", lenguaje.DescripcionLenguaje)
			};

            lenguaje.IdLenguaje = (int)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Lenguaje table.
		/// </summary>
		public void Update(LenguajeEntidad lenguaje)
		{
			ValidationUtility.ValidateArgument("lenguaje", lenguaje);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdLenguaje", lenguaje.IdLenguaje),
				new SqlParameter("@DescripcionLenguaje", lenguaje.DescripcionLenguaje)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Lenguaje table by its primary key.
		/// </summary>
		public void Delete(int idLenguaje)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdLenguaje", idLenguaje)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the Lenguaje table.
		/// </summary>
		public LenguajeEntidad Select(int idLenguaje)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdLenguaje", idLenguaje)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeSelect", parameters))
			{
                LenguajeEntidad LenguajeEntidad = new LenguajeEntidad();

                LenguajeEntidad = Mapeador.MapearFirst<LenguajeEntidad>(dt);

                return LenguajeEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the Lenguaje table.
		/// </summary>
		public List<LenguajeEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "LenguajeSelectAll"))
			{
				List<LenguajeEntidad> lenguajeEntidadList = new List<LenguajeEntidad>();

                lenguajeEntidadList = Mapeador.Mapear<LenguajeEntidad>(dt);

				return lenguajeEntidadList;
			}
		}


		#endregion
	}
}
