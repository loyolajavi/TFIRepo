using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class PedidoDetalleDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the PedidoDetalle table.
		/// </summary>
		public void Insert(PedidoDetalleEntidad pedidoDetalle)
		{
			ValidationUtility.ValidateArgument("pedidoDetalle", pedidoDetalle);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", pedidoDetalle.IdPedido),
				new SqlParameter("@Cantidad", pedidoDetalle.Cantidad),
				new SqlParameter("@PrecioUnitario", pedidoDetalle.PrecioUnitario),
				new SqlParameter("@IdProducto", pedidoDetalle.miProducto.IdProducto),
                new SqlParameter("@CUIT", pedidoDetalle.CUIT)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the PedidoDetalle table.
		/// </summary>
		public void Update(PedidoDetalleEntidad pedidoDetalle)
		{
			ValidationUtility.ValidateArgument("pedidoDetalle", pedidoDetalle);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedidoDetalle", pedidoDetalle.IdPedidoDetalle),
				new SqlParameter("@IdPedido", pedidoDetalle.IdPedido),
				new SqlParameter("@Cantidad", pedidoDetalle.Cantidad),
				new SqlParameter("@PrecioUnitario", pedidoDetalle.PrecioUnitario),
				new SqlParameter("@IdProducto", pedidoDetalle.miProducto.IdProducto)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the PedidoDetalle table by its primary key.
		/// </summary>
		public void Delete(int idPedido, int idPedidoDetalle)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdPedidoDetalle", idPedidoDetalle)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the PedidoDetalle table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleDeleteAllByIdPedido", parameters);
		}

		/// <summary>
		/// Deletes a record from the PedidoDetalle table by a foreign key.
		/// </summary>
		public void DeleteAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleDeleteAllByIdProducto", parameters);
		}

		/// <summary>
		/// Selects a single record from the PedidoDetalle table.
		/// </summary>
		public PedidoDetalleEntidad Select(int idPedido, int idPedidoDetalle)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdPedidoDetalle", idPedidoDetalle)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleSelect", parameters))
			{
                PedidoDetalleEntidad PedidoDetalleEntidad = new PedidoDetalleEntidad();

                PedidoDetalleEntidad = Mapeador.MapearFirst<PedidoDetalleEntidad>(dt);

                return PedidoDetalleEntidad;
			}
		}

		
		/// <summary>
		/// Selects all records from the PedidoDetalle table.
		/// </summary>
		public List<PedidoDetalleEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleSelectAll"))
			{
				List<PedidoDetalleEntidad> pedidoDetalleEntidadList = new List<PedidoDetalleEntidad>();

                pedidoDetalleEntidadList = Mapeador.Mapear<PedidoDetalleEntidad>(dt);

				return pedidoDetalleEntidadList;
			}
		}



		/// <summary>
		/// Selects all records from the PedidoDetalle table by a foreign key.
		/// </summary>
		public List<PedidoDetalleEntidad> SelectAllByIdPedido(int idPedido)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

			using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleSelectAllByIdPedido", parameters))
			{
				List<PedidoDetalleEntidad> pedidoDetalleEntidadList = new List<PedidoDetalleEntidad>();

                pedidoDetalleEntidadList = MapearMuchosPedidosDetalles(dt);

				return pedidoDetalleEntidadList;
			}
		}



        private List<PedidoDetalleEntidad> MapearMuchosPedidosDetalles(DataSet ds)
        {
            List<PedidoDetalleEntidad> ResUnosPedidosDetalles = new List<PedidoDetalleEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    PedidoDetalleEntidad unPedDet = new PedidoDetalleEntidad();

                    unPedDet.IdPedidoDetalle = (int)row["IdPedidoDetalle"];
                    unPedDet.IdPedido = (int)row["IdPedido"];
                    unPedDet.Cantidad = (int)row["Cantidad"];
                    unPedDet.PrecioUnitario = (decimal)row["PrecioUnitario"];
                    if (row["FecBaja"].ToString() != "")
                        unPedDet.FecBaja = DateTime.Parse(row["FecBaja"].ToString());
                    unPedDet.CUIT = row["CUIT"].ToString();
                    unPedDet.miProducto = new ProductoEntidad();
                    unPedDet.miProducto.IdProducto = (int)row["IdProducto"];
                    unPedDet.miProducto.CodigoProducto = row["CodigoProducto"].ToString();
                    unPedDet.miProducto.DescripProducto = row["DescripProducto"].ToString();

                    ResUnosPedidosDetalles.Add(unPedDet);
                }
                return ResUnosPedidosDetalles;
            }
            catch (Exception es)
            {
                throw;
            }

        }


		/// <summary>
		/// Selects all records from the PedidoDetalle table by a foreign key.
		/// </summary>
		public List<PedidoDetalleEntidad> SelectAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDetalleSelectAllByIdProducto", parameters))
			{
				List<PedidoDetalleEntidad> pedidoDetalleEntidadList = new List<PedidoDetalleEntidad>();

                pedidoDetalleEntidadList = Mapeador.Mapear<PedidoDetalleEntidad>(dt);

				return pedidoDetalleEntidadList;
			}
		}

	

		#endregion
	}
}
