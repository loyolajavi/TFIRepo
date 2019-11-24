using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class ProvinciaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Provincia table.
		/// </summary>
		public void Insert(ProvinciaEntidad provincia)
		{
			ValidationUtility.ValidateArgument("provincia", provincia);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProvincia", provincia.IdProvincia),
				new SqlParameter("@DescripcionProvincia", provincia.DescripcionProvincia)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Provincia table.
		/// </summary>
		public void Update(ProvinciaEntidad provincia)
		{
			ValidationUtility.ValidateArgument("provincia", provincia);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProvincia", provincia.IdProvincia),
				new SqlParameter("@DescripcionProvincia", provincia.DescripcionProvincia)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Provincia table by its primary key.
		/// </summary>
		public void Delete(int idProvincia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProvincia", idProvincia)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the Provincia table.
		/// </summary>
		public ProvinciaEntidad Select(int idProvincia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProvincia", idProvincia)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaSelect", parameters))
			{
                ProvinciaEntidad provincia = new ProvinciaEntidad();
                //       

                provincia = Mapeador.MapearFirst<ProvinciaEntidad>(dt);



                return provincia;
			}
		}


		/// <summary>
		/// Selects all records from the Provincia table.
		/// </summary>
		public List<ProvinciaEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaSelectAll"))
			{
                List<ProvinciaEntidad> provincias = new List<ProvinciaEntidad>();
                provincias = Mapeador.Mapear<ProvinciaEntidad>(dt);

                return provincias;
			}
		}

	

		#endregion
	}
}
