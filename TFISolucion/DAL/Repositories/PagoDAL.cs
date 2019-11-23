using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class PagoDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Pago table.
		/// </summary>
		public void Insert(PagoEntidad pago)
		{
			ValidationUtility.ValidateArgument("pago", pago);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", pago.IdPedido),
                new SqlParameter("@FechaPago", pago.FechaPago),
				new SqlParameter("@IdFormaPago", pago.miFormaPago.IdFormaPago),
				new SqlParameter("@MontoPago", pago.MontoPago),
				new SqlParameter("@CUIT", pago.CUIT)
			};

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Pago table.
		/// </summary>
		public void Update(PagoEntidad pago)
		{
			ValidationUtility.ValidateArgument("pago", pago);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", pago.IdPedido),
				new SqlParameter("@FechaPago", pago.FechaPago),
				new SqlParameter("@IdFormaPago", pago.miFormaPago.IdFormaPago),
				new SqlParameter("@MontoPago", pago.MontoPago),
				new SqlParameter("@CUIT", pago.CUIT)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Pago table by its primary key.
		/// </summary>
		public void Delete(int idPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPago", idPago)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoDelete", parameters);
		}

		
		/// <summary>
		/// Deletes a record from the Pago table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoDeleteAllByIdPedido", parameters);
		}

		/// <summary>
		/// Selects a single record from the Pago table.
		/// </summary>
		public PagoEntidad Select(int idPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPago", idPago)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoSelect", parameters))
			{
                PagoEntidad PagoEntidad = new PagoEntidad();

                PagoEntidad = Mapeador.MapearFirst<PagoEntidad>(dt);

                return PagoEntidad;
			}
		}

	

		/// <summary>
		/// Selects all records from the Pago table.
		/// </summary>
		public List<PagoEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoSelectAll"))
			{
				List<PagoEntidad> pagoEntidadList = new List<PagoEntidad>();

                pagoEntidadList = Mapeador.Mapear<PagoEntidad>(dt);

				return pagoEntidadList;
			}
		}



		/// <summary>
		/// Selects all records from the Pago table by a foreign key.
		/// </summary>
		public List<PagoEntidad> SelectAllByCUIT(string CUIT)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoSelectAllByCUIT", parameters))
			{
				List<PagoEntidad> pagoEntidadList = new List<PagoEntidad>();

                pagoEntidadList = Mapeador.Mapear<PagoEntidad>(dt);

				return pagoEntidadList;
			}
		}

		

		/// <summary>
		/// Selects all records from the Pago table by a foreign key.
		/// </summary>
		public List<PagoEntidad> SelectAllByIdFormaPago(int idFormaPago)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFormaPago", idFormaPago)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoSelectAllByIdFormaPago", parameters))
			{
				List<PagoEntidad> pagoEntidadList = new List<PagoEntidad>();

                pagoEntidadList = Mapeador.Mapear<PagoEntidad>(dt);

				return pagoEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the Pago table by a foreign key.
		/// </summary>
		public List<PagoEntidad> SelectAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoSelectAllByIdPedido", parameters))
			{
				List<PagoEntidad> pagoEntidadList = new List<PagoEntidad>();

                pagoEntidadList = Mapeador.Mapear<PagoEntidad>(dt);

				return pagoEntidadList;
			}
		}

		

		#endregion
	}
}
