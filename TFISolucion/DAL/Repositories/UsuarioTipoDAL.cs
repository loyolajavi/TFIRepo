using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class UsuarioTipoDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the UsuarioTipo table.
		/// </summary>
		public void Insert(UsuarioTipoEntidad usuarioTipo)
		{
			ValidationUtility.ValidateArgument("usuarioTipo", usuarioTipo);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Descripcion", usuarioTipo.Descripcion)
			};

			usuarioTipo.IdUsuarioTipo = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTipoInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the UsuarioTipo table.
		/// </summary>
		public void Update(UsuarioTipoEntidad usuarioTipo)
		{
			ValidationUtility.ValidateArgument("usuarioTipo", usuarioTipo);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuarioTipo", usuarioTipo.IdUsuarioTipo),
				new SqlParameter("@Descripcion", usuarioTipo.Descripcion)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTipoUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the UsuarioTipo table by its primary key.
		/// </summary>
		public void Delete(int idUsuarioTipo)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuarioTipo", idUsuarioTipo)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTipoDelete", parameters);
		}

		/// <summary>
		/// Selects a single record from the UsuarioTipo table.
		/// </summary>
		public UsuarioTipoEntidad Select(int idUsuarioTipo)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuarioTipo", idUsuarioTipo)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTipoSelect", parameters))
			{
                UsuarioTipoEntidad entidad = new UsuarioTipoEntidad();
                //       

                entidad = Mapeador.MapearFirst<UsuarioTipoEntidad>(dt);



                return entidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the UsuarioTipo table.
		/// </summary>
		public List<UsuarioTipoEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTipoSelectAll"))
			{
                List<UsuarioTipoEntidad> lista = new List<UsuarioTipoEntidad>();
                lista = Mapeador.Mapear<UsuarioTipoEntidad>(dt);

                return lista;
			}
		}


		#endregion
	}
}
