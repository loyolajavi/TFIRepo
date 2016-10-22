using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class EstadoPedidoDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the EstadoPedido table.
		/// </summary>
		public void Insert(EstadoPedidoEntidad estadoPedido)
		{
			ValidationUtility.ValidateArgument("estadoPedido", estadoPedido);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@DescripcionEstadoPedido", estadoPedido.DescripcionEstadoPedido)
			};

			estadoPedido.IdEstadoPedido = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPedidoInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the EstadoPedido table.
		/// </summary>
		public void Update(EstadoPedidoEntidad estadoPedido)
		{
			ValidationUtility.ValidateArgument("estadoPedido", estadoPedido);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPedido", estadoPedido.IdEstadoPedido),
				new SqlParameter("@DescripcionEstadoPedido", estadoPedido.DescripcionEstadoPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPedidoUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the EstadoPedido table by its primary key.
		/// </summary>
		public void Delete(int idEstadoPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPedidoDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the EstadoPedido table.
		/// </summary>
		public EstadoPedidoEntidad Select(int idEstadoPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPedidoSelect", parameters))
			{
                EstadoPedidoEntidad EstadoPedidoEntidad = new EstadoPedidoEntidad();

                EstadoPedidoEntidad = Mapeador.MapearFirst<EstadoPedidoEntidad>(dt);

                return EstadoPedidoEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the EstadoPedido table.
		/// </summary>
		public List<EstadoPedidoEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "EstadoPedidoSelectAll"))
			{
				List<EstadoPedidoEntidad> estadoPedidoEntidadList = new List<EstadoPedidoEntidad>();

                estadoPedidoEntidadList = Mapeador.Mapear<EstadoPedidoEntidad>(dt);

				return estadoPedidoEntidadList;
			}
		}

		
		#endregion
	}
}
