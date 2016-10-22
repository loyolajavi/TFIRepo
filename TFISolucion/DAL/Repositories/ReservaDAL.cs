using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;
namespace TFI.DAL.DAL
{
	public class ReservaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the Reserva table.
		/// </summary>
		public void Insert(ReservaEntidad reserva)
		{
			ValidationUtility.ValidateArgument("reserva", reserva);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", reserva.IdPedido),
				new SqlParameter("@IdPedidoDetalle", reserva.IdPedidoDetalle),
				new SqlParameter("@IdSucursal", reserva.IdSucursal),
				new SqlParameter("@Activo", reserva.Activo),
				new SqlParameter("@Fecha", reserva.Fecha)
			};

			reserva.IdReserva = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Reserva table.
		/// </summary>
		public void Update(ReservaEntidad reserva)
		{
			ValidationUtility.ValidateArgument("reserva", reserva);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdReserva", reserva.IdReserva),
				new SqlParameter("@IdPedido", reserva.IdPedido),
				new SqlParameter("@IdPedidoDetalle", reserva.IdPedidoDetalle),
				new SqlParameter("@IdSucursal", reserva.IdSucursal),
				new SqlParameter("@Activo", reserva.Activo),
				new SqlParameter("@Fecha", reserva.Fecha)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Reserva table by its primary key.
		/// </summary>
		public void Delete(int idReserva)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdReserva", idReserva)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the Reserva table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPedido_IdPedidoDetalle(int idPedido, int idPedidoDetalle)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdPedidoDetalle", idPedidoDetalle)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaDeleteAllByIdPedido_IdPedidoDetalle", parameters);
		}

		/// <summary>
		/// Deletes a record from the Reserva table by a foreign key.
		/// </summary>
		public void DeleteAllByIdSucursal(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaDeleteAllByIdSucursal", parameters);
		}

		/// <summary>
		/// Selects a single record from the Reserva table.
		/// </summary>
		public ReservaEntidad Select(int idReserva)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdReserva", idReserva)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaSelect", parameters))
			{
                ReservaEntidad ReservaEntidad = new ReservaEntidad();
                //       

                ReservaEntidad = Mapeador.MapearFirst<ReservaEntidad>(dt);



                return ReservaEntidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the Reserva table.
		/// </summary>
		public List<ReservaEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaSelectAll"))
			{
                List<ReservaEntidad> reservas = new List<ReservaEntidad>();
                reservas = Mapeador.Mapear<ReservaEntidad>(dt);

                return reservas;
			}
		}

	
		/// <summary>
		/// Selects all records from the Reserva table by a foreign key.
		/// </summary>
		public List<ReservaEntidad> SelectAllByIdPedido_IdPedidoDetalle(int idPedido, int idPedidoDetalle)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdPedidoDetalle", idPedidoDetalle)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaSelectAllByIdPedido_IdPedidoDetalle", parameters))
			{
                List<ReservaEntidad> reservas = new List<ReservaEntidad>();
                reservas = Mapeador.Mapear<ReservaEntidad>(dt);

                return reservas;
			}
		}

		/// <summary>
		/// Selects all records from the Reserva table by a foreign key.
		/// </summary>
		public List<ReservaEntidad> SelectAllByIdSucursal(int idSucursal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdSucursal", idSucursal)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReservaSelectAllByIdSucursal", parameters))
			{
                List<ReservaEntidad> reservas = new List<ReservaEntidad>();
                reservas = Mapeador.Mapear<ReservaEntidad>(dt);

                return reservas;
			}
		}

	

	


		#endregion
	}
}
