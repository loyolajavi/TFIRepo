using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class ListaDeseoDAL

    {
		#region Methods

		/// <summary>
		/// Saves a record to the ListaDeseos table.
		/// </summary>
		public void Insert(ListaDeseoEntidad listaDeseo)
		{
			ValidationUtility.ValidateArgument("listaDeseo", listaDeseo);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", listaDeseo.CUIT),
				new SqlParameter("@NombreUsuario", listaDeseo.NombreUsuario)
			};

			listaDeseo.IdListaDeseos = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the ListaDeseos table.
		/// </summary>
		public void Update(ListaDeseoEntidad listaDeseo)
		{
			ValidationUtility.ValidateArgument("listaDeseo", listaDeseo);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", listaDeseo.IdListaDeseos),
				new SqlParameter("@CUIT", listaDeseo.CUIT),
				new SqlParameter("@NombreUsuario", listaDeseo.NombreUsuario)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the ListaDeseos table by its primary key.
		/// </summary>
		public void Delete(int idListaDeseos)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", idListaDeseos)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the ListaDeseos table by a foreign key.
		/// </summary>
		public void DeleteAllByCUIT_NombreUsuario(int cUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosDeleteAllByCUIT_NombreUsuario", parameters);
		}

		/// <summary>
		/// Selects a single record from the ListaDeseos table.
		/// </summary>
		public ListaDeseoEntidad Select(int idListaDeseos)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdListaDeseos", idListaDeseos)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosSelect", parameters))
			{
                ListaDeseoEntidad ListaDeseoEntidad = new ListaDeseoEntidad();

                ListaDeseoEntidad = Mapeador.MapearFirst<ListaDeseoEntidad>(dt);

                return ListaDeseoEntidad;	
			}
		}


		/// <summary>
		/// Selects all records from the ListaDeseos table.
		/// </summary>
		public List<ListaDeseoEntidad> SelectAll()
		{
			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosSelectAll"))
			{
				List<ListaDeseoEntidad> listaDeseoEntidadList = new List<ListaDeseoEntidad>();

                listaDeseoEntidadList = Mapeador.Mapear<ListaDeseoEntidad>(dt);

				return listaDeseoEntidadList;
			}
		}


		/// <summary>
		/// Selects all records from the ListaDeseos table by a foreign key.
		/// </summary>
		public List<ListaDeseoEntidad> SelectAllByCUIT_NombreUsuario(int cUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

			using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosSelectAllByCUIT_NombreUsuario", parameters))
			{
				List<ListaDeseoEntidad> listaDeseoEntidadList = new List<ListaDeseoEntidad>();
	
                listaDeseoEntidadList = Mapeador.Mapear<ListaDeseoEntidad>(dt);

				return listaDeseoEntidadList;
			}
		}


		#endregion
	}
}
