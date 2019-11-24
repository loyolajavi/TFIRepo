using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class MarcaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Marca table.
		/// </summary>
		public void Insert(MarcaEntidad marca)
		{
			ValidationUtility.ValidateArgument("marca", marca);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripcionMarca", marca.DescripcionMarca)
			};

            marca.IdMarca = (int)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MarcaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Marca table.
		/// </summary>
		public void Update(MarcaEntidad marca)
		{
			ValidationUtility.ValidateArgument("marca", marca);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMarca", marca.IdMarca),
				new SqlParameter("@DescripcionMarca", marca.DescripcionMarca)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MarcaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Marca table by its primary key.
		/// </summary>
		public void Delete(int idMarca)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMarca", idMarca)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MarcaDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the Marca table.
		/// </summary>
		public MarcaEntidad Select(int idMarca)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMarca", idMarca)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MarcaSelect", parameters))
			{
                MarcaEntidad MarcaEntidad = new MarcaEntidad();

                MarcaEntidad = Mapeador.MapearFirst<MarcaEntidad>(dt);

                return MarcaEntidad;
			}
		}



		/// <summary>
		/// Selects all records from the Marca table.
		/// </summary>
		public List<MarcaEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MarcaSelectAll"))
			{
				List<MarcaEntidad> marcaEntidadList = new List<MarcaEntidad>();

                marcaEntidadList = Mapeador.Mapear<MarcaEntidad>(dt);

				return marcaEntidadList;
			}
		}

	

		#endregion
	}
}
