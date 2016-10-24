using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class UsuarioFamiliaDAL
	{


		#region Methods

		/// <summary>
		/// Saves a record to the UsuarioFamilia table.
		/// </summary>
		public void Insert(UsuarioFamiliaEntidad usuarioFamilia)
		{
			ValidationUtility.ValidateArgument("usuarioFamilia", usuarioFamilia);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", usuarioFamilia.CUIT),
				new SqlParameter("@NombreUsuario", usuarioFamilia.NombreUsuario),
				new SqlParameter("@IdFamilia", usuarioFamilia.IdFamilia)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaInsert", parameters);
		}

		/// <summary>
		/// Deletes a record from the UsuarioFamilia table by its primary key.
		/// </summary>
		public void Delete(string CUIT, string nombreUsuario, int idFamilia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario),
				new SqlParameter("@IdFamilia", idFamilia)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the UsuarioFamilia table by a foreign key.
		/// </summary>
		public void DeleteAllByIdFamilia(int idFamilia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFamilia", idFamilia)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaDeleteAllByIdFamilia", parameters);
		}

		/// <summary>
		/// Deletes a record from the UsuarioFamilia table by a foreign key.
		/// </summary>
		public void DeleteAllByCUIT_NombreUsuario(string CUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaDeleteAllByCUIT_NombreUsuario", parameters);
		}

		/// <summary>
		/// Selects a single record from the UsuarioFamilia table.
		/// </summary>
		public UsuarioFamiliaEntidad Select(string CUIT, string nombreUsuario, int idFamilia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario),
				new SqlParameter("@IdFamilia", idFamilia)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaSelect", parameters))
			{
                UsuarioFamiliaEntidad entidad = new UsuarioFamiliaEntidad();
                //       

                entidad = Mapeador.MapearFirst<UsuarioFamiliaEntidad>(dt);



                return entidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the UsuarioFamilia table by a foreign key.
		/// </summary>
		public List<UsuarioFamiliaEntidad> SelectAllByIdFamilia(int idFamilia)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdFamilia", idFamilia)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaSelectAllByIdFamilia", parameters))
			{
                List<UsuarioFamiliaEntidad> lista = new List<UsuarioFamiliaEntidad>();
                lista = Mapeador.Mapear<UsuarioFamiliaEntidad>(dt);

                return lista;
			}
		}

		/// <summary>
		/// Selects all records from the UsuarioFamilia table by a foreign key.
		/// </summary>
		public List<UsuarioFamiliaEntidad> SelectAllByCUIT_NombreUsuario(string CUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaSelectAllByCUIT_NombreUsuario", parameters))
            {
                List<UsuarioFamiliaEntidad> lista = new List<UsuarioFamiliaEntidad>();
                lista = Mapeador.Mapear<UsuarioFamiliaEntidad>(dt);

                return lista;
            }
		}

	

	

	

		#endregion
	}
}
