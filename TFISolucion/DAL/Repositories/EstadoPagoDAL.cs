using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class EstadoPagoDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the EstadoPago table.
		/// </summary>
		public void Insert(EstadoPagoEntidad estadoPago)
		{
			ValidationUtility.ValidateArgument("estadoPago", estadoPago);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripEstadoPago", estadoPago.DescripEstadoPago)
			};

			estadoPago.IdEstadoPago = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPagoInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the EstadoPago table.
		/// </summary>
		public void Update(EstadoPagoEntidad estadoPago)
		{
			ValidationUtility.ValidateArgument("estadoPago", estadoPago);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", estadoPago.IdEstadoPago),
				new SqlParameter("@DescripEstadoPago", estadoPago.DescripEstadoPago)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPagoUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the EstadoPago table by its primary key.
		/// </summary>
		public void Delete(int idEstadoPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", idEstadoPago)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPagoDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the EstadoPago table.
		/// </summary>
		public EstadoPagoEntidad Select(int idEstadoPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", idEstadoPago)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPagoSelect", parameters))
			{
                EstadoPagoEntidad EstadoPagoEntidad = new EstadoPagoEntidad();

                EstadoPagoEntidad = Mapeador.MapearFirst<EstadoPagoEntidad>(dt);

                return EstadoPagoEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the EstadoPago table.
		/// </summary>
		public List<EstadoPagoEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPagoSelectAll"))
			{
				List<EstadoPagoEntidad> estadoPagoEntidadList = new List<EstadoPagoEntidad>();

                estadoPagoEntidadList = Mapeador.Mapear<EstadoPagoEntidad>(dt);


				return estadoPagoEntidadList;
			}
		}

	
		#endregion
	}
}
