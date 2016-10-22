using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class FormaEntregaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the FormaEntrega table.
		/// </summary>
		public void Insert(FormaEntregaEntidad formaEntrega)
		{
			ValidationUtility.ValidateArgument("formaEntrega", formaEntrega);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripcionFormaEntrega", formaEntrega.DescripcionFormaEntrega)
			};

			formaEntrega.IdFormaEntrega = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaEntregaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the FormaEntrega table.
		/// </summary>
		public void Update(FormaEntregaEntidad formaEntrega)
		{
			ValidationUtility.ValidateArgument("formaEntrega", formaEntrega);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFormaEntrega", formaEntrega.IdFormaEntrega),
				new SqlParameter("@DescripcionFormaEntrega", formaEntrega.DescripcionFormaEntrega)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaEntregaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the FormaEntrega table by its primary key.
		/// </summary>
		public void Delete(int idFormaEntrega)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFormaEntrega", idFormaEntrega)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaEntregaDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the FormaEntrega table.
		/// </summary>
		public FormaEntregaEntidad Select(int idFormaEntrega)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFormaEntrega", idFormaEntrega)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaEntregaSelect", parameters))
			{
                FormaEntregaEntidad FormaEntregaEntidad = new FormaEntregaEntidad();

                FormaEntregaEntidad = Mapeador.MapearFirst<FormaEntregaEntidad>(dt);

                return FormaEntregaEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the FormaEntrega table.
		/// </summary>
		public List<FormaEntregaEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FormaEntregaSelectAll"))
			{
				List<FormaEntregaEntidad> formaEntregaEntidadList = new List<FormaEntregaEntidad>();

                formaEntregaEntidadList = Mapeador.Mapear<FormaEntregaEntidad>(dt);

				return formaEntregaEntidadList;
			}
		}

	
		#endregion
	}
}
