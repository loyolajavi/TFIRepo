using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;
namespace TFI.DAL.DAL
{
	public class UsuarioPatenteDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the UsuarioPatente table.
		/// </summary>
		public void Insert(UsuarioPatenteEntidad usuarioPatente)
		{
			ValidationUtility.ValidateArgument("usuarioPatente", usuarioPatente);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", usuarioPatente.CUIT),
				new SqlParameter("@NombreUsuario", usuarioPatente.NombreUsuario),
				new SqlParameter("@IdPatente", usuarioPatente.IdPatente)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioPatenteInsert", parameters);
		}

		/// <summary>
		/// Deletes a record from the UsuarioPatente table by its primary key.
		/// </summary>
		public void Delete(int cUIT, string nombreUsuario, int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario),
				new SqlParameter("@IdPatente", idPatente)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioPatenteDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the UsuarioPatente table by a foreign key.
		/// </summary>
		public void DeleteAllByIdPatente(int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", idPatente)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioPatenteDeleteAllByIdPatente", parameters);
		}

		/// <summary>
		/// Deletes a record from the UsuarioPatente table by a foreign key.
		/// </summary>
		public void DeleteAllByCUIT_NombreUsuario(int cUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioPatenteDeleteAllByCUIT_NombreUsuario", parameters);
		}

		/// <summary>
		/// Selects a single record from the UsuarioPatente table.
		/// </summary>
		public UsuarioPatenteEntidad Select(int cUIT, string nombreUsuario, int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario),
				new SqlParameter("@IdPatente", idPatente)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioPatenteSelect", parameters))
			{
                UsuarioPatenteEntidad entidad = new UsuarioPatenteEntidad();
                //       

                entidad = Mapeador.MapearFirst<UsuarioPatenteEntidad>(dt);



                return entidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the UsuarioPatente table by a foreign key.
		/// </summary>
		public List<UsuarioPatenteEntidad> SelectAllByIdPatente(int idPatente)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPatente", idPatente)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioPatenteSelectAllByIdPatente", parameters))
			{
                List<UsuarioPatenteEntidad> lista = new List<UsuarioPatenteEntidad>();
                lista = Mapeador.Mapear<UsuarioPatenteEntidad>(dt);

                return lista;
			}
		}

		/// <summary>
		/// Selects all records from the UsuarioPatente table by a foreign key.
		/// </summary>
		public List<UsuarioPatenteEntidad> SelectAllByCUIT_NombreUsuario(int cUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioPatenteSelectAllByCUIT_NombreUsuario", parameters))
			{
                List<UsuarioPatenteEntidad> lista = new List<UsuarioPatenteEntidad>();
                lista = Mapeador.Mapear<UsuarioPatenteEntidad>(dt);

                return lista;
			}
		}


	
	
		#endregion
	}
}
