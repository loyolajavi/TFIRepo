using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class PedidoEstadoPedidoDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the PedidoEstadoPedido table.
		/// </summary>
		public void Insert(PedidoEstadoPedidoEntidad pedidoEstadoPedido)
		{
			ValidationUtility.ValidateArgument("pedidoEstadoPedido", pedidoEstadoPedido);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", pedidoEstadoPedido.IdPedido),
				new SqlParameter("@IdEstadoPedido", pedidoEstadoPedido.IdEstadoPedido),
				new SqlParameter("@Fecha", pedidoEstadoPedido.Fecha),
				new SqlParameter("@FecBaja", pedidoEstadoPedido.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the PedidoEstadoPedido table.
		/// </summary>
		public void Update(PedidoEstadoPedidoEntidad pedidoEstadoPedido)
		{
			ValidationUtility.ValidateArgument("pedidoEstadoPedido", pedidoEstadoPedido);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", pedidoEstadoPedido.IdPedido),
				new SqlParameter("@IdEstadoPedido", pedidoEstadoPedido.IdEstadoPedido),
				new SqlParameter("@Fecha", pedidoEstadoPedido.Fecha),
				new SqlParameter("@FecBaja", pedidoEstadoPedido.FecBaja)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the PedidoEstadoPedido table by its primary key.
		/// </summary>
		public void Delete(int idPedido, int idEstadoPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the PedidoEstadoPedido table by a foreign key.
		/// </summary>
		public void DeleteAllByIdEstadoPedido(int idEstadoPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoDeleteAllByIdEstadoPedido", parameters);
		}

		/// <summary>
		/// Deletes a record from the PedidoEstadoPedido table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoDeleteAllByIdPedido", parameters);
		}

		/// <summary>
		/// Selects a single record from the PedidoEstadoPedido table.
		/// </summary>
		public PedidoEstadoPedidoEntidad Select(int idPedido, int idEstadoPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelect", parameters))
			{
                PedidoEstadoPedidoEntidad unPedidoEstadoPedidoEntidad = new PedidoEstadoPedidoEntidad();

                unPedidoEstadoPedidoEntidad = Mapeador.MapearFirst<PedidoEstadoPedidoEntidad>(dt);

                return unPedidoEstadoPedidoEntidad;
			}
		}

		
		/// <summary>
		/// Selects all records from the PedidoEstadoPedido table.
		/// </summary>
		public List<PedidoEstadoPedidoEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelectAll"))
			{
				List<PedidoEstadoPedidoEntidad> pedidoEstadoPedidoEntidadList = new List<PedidoEstadoPedidoEntidad>();

                pedidoEstadoPedidoEntidadList = Mapeador.Mapear<PedidoEstadoPedidoEntidad>(dt);

				return pedidoEstadoPedidoEntidadList;
			}
		}

		
		/// <summary>
		/// Selects all records from the PedidoEstadoPedido table by a foreign key.
		/// </summary>
		public List<PedidoEstadoPedidoEntidad> SelectAllByIdEstadoPedido(int idEstadoPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelectAllByIdEstadoPedido", parameters))
			{
				List<PedidoEstadoPedidoEntidad> pedidoEstadoPedidoEntidadList = new List<PedidoEstadoPedidoEntidad>();

                pedidoEstadoPedidoEntidadList = Mapeador.Mapear<PedidoEstadoPedidoEntidad>(dt);

				return pedidoEstadoPedidoEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the PedidoEstadoPedido table by a foreign key.
		/// </summary>
		public List<PedidoEstadoPedidoEntidad> SelectAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelectAllByIdPedido", parameters))
			{
				List<PedidoEstadoPedidoEntidad> pedidoEstadoPedidoEntidadList = new List<PedidoEstadoPedidoEntidad>();

                pedidoEstadoPedidoEntidadList = Mapeador.Mapear<PedidoEstadoPedidoEntidad>(dt);

				return pedidoEstadoPedidoEntidadList;
			}
		}

	

		#endregion
	}
}
