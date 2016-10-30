using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class ListaDeseosDetalleDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the ListaDeseosDetalle table.
		/// </summary>
		public void Insert(ListaDeseosDetalleEntidad listaDeseosDetalle)
		{
			ValidationUtility.ValidateArgument("listaDeseosDetalle", listaDeseosDetalle);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", listaDeseosDetalle.IdListaDeseos),
				new SqlParameter("@IdProducto", listaDeseosDetalle.IdProducto),
                new SqlParameter("@CUIT", listaDeseosDetalle.CUIT),
				new SqlParameter("@FechaDeseoDetalle", listaDeseosDetalle.FechaDeseoDetalle)
			};

            listaDeseosDetalle.IdListaDeseosDetalle = (int)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the ListaDeseosDetalle table.
		/// </summary>
		public void Update(ListaDeseosDetalleEntidad listaDeseosDetalle)
		{
			ValidationUtility.ValidateArgument("listaDeseosDetalle", listaDeseosDetalle);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", listaDeseosDetalle.IdListaDeseos),
				new SqlParameter("@IdListaDeseosDetalle", listaDeseosDetalle.IdListaDeseosDetalle),
				new SqlParameter("@IdProducto", listaDeseosDetalle.IdProducto),
				new SqlParameter("@FechaDeseoDetalle", listaDeseosDetalle.FechaDeseoDetalle)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the ListaDeseosDetalle table by its primary key.
		/// </summary>
		public void Delete(int idListaDeseos, int idListaDeseosDetalle)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", idListaDeseos),
				new SqlParameter("@IdListaDeseosDetalle", idListaDeseosDetalle)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the ListaDeseosDetalle table by a foreign key.
		/// </summary>
		public void DeleteAllByIdListaDeseos(int idListaDeseos)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", idListaDeseos)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleDeleteAllByIdListaDeseos", parameters);
		}

		/// <summary>
		/// Deletes a record from the ListaDeseosDetalle table by a foreign key.
		/// </summary>
		public void DeleteAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleDeleteAllByIdProducto", parameters);
		}

		/// <summary>
		/// Selects a single record from the ListaDeseosDetalle table.
		/// </summary>
		public ListaDeseosDetalleEntidad Select(int idListaDeseos, int idListaDeseosDetalle)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", idListaDeseos),
				new SqlParameter("@IdListaDeseosDetalle", idListaDeseosDetalle)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleSelect", parameters))
			{
                ListaDeseosDetalleEntidad ListaDeseosDetalleEntidad = new ListaDeseosDetalleEntidad();

                ListaDeseosDetalleEntidad = Mapeador.MapearFirst<ListaDeseosDetalleEntidad>(dt);

                return ListaDeseosDetalleEntidad;
			}
		}


		/// <summary>
		/// Selects all records from the ListaDeseosDetalle table.
		/// </summary>
		public List<ListaDeseosDetalleEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleSelectAll"))
			{
				List<ListaDeseosDetalleEntidad> listaDeseosDetalleEntidadList = new List<ListaDeseosDetalleEntidad>();

                listaDeseosDetalleEntidadList = Mapeador.Mapear<ListaDeseosDetalleEntidad>(dt);

				return listaDeseosDetalleEntidadList;
			}
		}

	

		/// <summary>
		/// Selects all records from the ListaDeseosDetalle table by a foreign key.
		/// </summary>
		public List<ListaDeseosDetalleEntidad> SelectAllByIdListaDeseos(int idListaDeseos)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", idListaDeseos)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleSelectAllByIdListaDeseos", parameters))
			{
				List<ListaDeseosDetalleEntidad> listaDeseosDetalleEntidadList = new List<ListaDeseosDetalleEntidad>();

                listaDeseosDetalleEntidadList = Mapeador.Mapear<ListaDeseosDetalleEntidad>(dt);

				return listaDeseosDetalleEntidadList;
			}
		}

		/// <summary>
		/// Selects all records from the ListaDeseosDetalle table by a foreign key.
		/// </summary>
		public List<ListaDeseosDetalleEntidad> SelectAllByIdProducto(int idProducto)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProducto", idProducto)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDetalleSelectAllByIdProducto", parameters))
			{
				List<ListaDeseosDetalleEntidad> listaDeseosDetalleEntidadList = new List<ListaDeseosDetalleEntidad>();

                listaDeseosDetalleEntidadList = Mapeador.Mapear<ListaDeseosDetalleEntidad>(dt);

				return listaDeseosDetalleEntidadList;
			}
		}


		#endregion
	}
}
