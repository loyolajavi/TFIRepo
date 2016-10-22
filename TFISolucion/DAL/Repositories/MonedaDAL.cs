using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class MonedaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Moneda table.
		/// </summary>
		public void Insert(MonedaEntidad moneda)
		{
			ValidationUtility.ValidateArgument("moneda", moneda);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Nombre", moneda.Nombre),
				new SqlParameter("@Cotizacion", moneda.Cotizacion)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Moneda table.
		/// </summary>
		public void Update(MonedaEntidad moneda)
		{
			ValidationUtility.ValidateArgument("moneda", moneda);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", moneda.IdMoneda),
				new SqlParameter("@Nombre", moneda.Nombre),
				new SqlParameter("@Cotizacion", moneda.Cotizacion)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Moneda table by its primary key.
		/// </summary>
		public void Delete(int idMoneda)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", idMoneda)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the Moneda table.
		/// </summary>
		public MonedaEntidad Select(int idMoneda)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdMoneda", idMoneda)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaSelect", parameters))
			{
                MonedaEntidad MonedaEntidad = new MonedaEntidad();

                MonedaEntidad = Mapeador.MapearFirst<MonedaEntidad>(dt);

                return MonedaEntidad;
			}
		}

	

		/// <summary>
		/// Selects all records from the Moneda table.
		/// </summary>
		public List<MonedaEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MonedaSelectAll"))
			{
				List<MonedaEntidad> monedaEntidadList = new List<MonedaEntidad>();

                monedaEntidadList = Mapeador.Mapear<MonedaEntidad>(dt);

				return monedaEntidadList;
			}
		}

		

		#endregion
	}
}
