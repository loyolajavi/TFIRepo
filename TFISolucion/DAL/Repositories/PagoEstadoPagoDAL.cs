using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class PagoEstadoPagoDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the PagoEstadoPago table.
		/// </summary>
		public void Insert(PagoEstadoPagoEntidad pagoEstadoPago)
		{
			ValidationUtility.ValidateArgument("pagoEstadoPago", pagoEstadoPago);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", pagoEstadoPago.IdEstadoPago),
				new SqlParameter("@IdPago", pagoEstadoPago.IdPago),
				new SqlParameter("@Fecha", pagoEstadoPago.Fecha),
				new SqlParameter("@FecBaja", pagoEstadoPago.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the PagoEstadoPago table.
		/// </summary>
		public void Update(PagoEstadoPagoEntidad pagoEstadoPago)
		{
			ValidationUtility.ValidateArgument("pagoEstadoPago", pagoEstadoPago);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", pagoEstadoPago.IdEstadoPago),
				new SqlParameter("@IdPago", pagoEstadoPago.IdPago),
				new SqlParameter("@Fecha", pagoEstadoPago.Fecha),
				new SqlParameter("@FecBaja", pagoEstadoPago.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the PagoEstadoPago table by its primary key.
		/// </summary>
		public void Delete(int idEstadoPago, int idPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", idEstadoPago),
				new SqlParameter("@IdPago", idPago)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the PagoEstadoPago table by a foreign key.
		/// </summary>
		public void DeleteAllByIdEstadoPago(int idEstadoPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", idEstadoPago)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoDeleteAllByIdEstadoPago", parameters);
		}

		/// <summary>
		/// Deletes a record from the PagoEstadoPago table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPago(int idPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPago", idPago)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoDeleteAllByIdPago", parameters);
		}

		/// <summary>
		/// Selects a single record from the PagoEstadoPago table.
		/// </summary>
		public PagoEstadoPagoEntidad Select(int idEstadoPago, int idPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", idEstadoPago),
				new SqlParameter("@IdPago", idPago)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoSelect", parameters))
			{
                PagoEstadoPagoEntidad unPagoEstadoPagoEntidad = new PagoEstadoPagoEntidad();

                unPagoEstadoPagoEntidad = Mapeador.MapearFirst<PagoEstadoPagoEntidad>(dt);

                return unPagoEstadoPagoEntidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the PagoEstadoPago table.
		/// </summary>
		public List<PagoEstadoPagoEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoSelectAll"))
			{
				List<PagoEstadoPagoEntidad> pagoEstadoPagoEntidadList = new List<PagoEstadoPagoEntidad>();

                pagoEstadoPagoEntidadList = Mapeador.Mapear<PagoEstadoPagoEntidad>(dt);

				return pagoEstadoPagoEntidadList;
			}
		}

	
		/// <summary>
		/// Selects all records from the PagoEstadoPago table by a foreign key.
		/// </summary>
		public List<PagoEstadoPagoEntidad> SelectAllByIdEstadoPago(int idEstadoPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPago", idEstadoPago)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoSelectAllByIdEstadoPago", parameters))
			{
				List<PagoEstadoPagoEntidad> pagoEstadoPagoEntidadList = new List<PagoEstadoPagoEntidad>();

                pagoEstadoPagoEntidadList = Mapeador.Mapear<PagoEstadoPagoEntidad>(dt);

				return pagoEstadoPagoEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the PagoEstadoPago table by a foreign key.
		/// </summary>
		public List<PagoEstadoPagoEntidad> SelectAllByIdPago(int idPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPago", idPago)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoEstadoPagoSelectAllByIdPago", parameters))
			{
				List<PagoEstadoPagoEntidad> pagoEstadoPagoEntidadList = new List<PagoEstadoPagoEntidad>();

                pagoEstadoPagoEntidadList = Mapeador.Mapear<PagoEstadoPagoEntidad>(dt);

				return pagoEstadoPagoEntidadList;
			}
		}

		
		#endregion
	}
}
