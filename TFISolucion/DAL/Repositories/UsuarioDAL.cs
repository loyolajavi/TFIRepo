using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL; using TFI.Entidades;
namespace TFI.DAL.DAL
{
	public class UsuarioDAL
	{

		#region Methods

		/// <summary>
		/// Saves a record to the Usuario table.
		/// </summary>
		public void Insert(UsuarioEntidad usuario)
		{
			ValidationUtility.ValidateArgument("usuario", usuario);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCondicionFiscal", usuario.IdCondicionFiscal),
				new SqlParameter("@IdUsuarioTipo", usuario.IdUsuarioTipo),
				new SqlParameter("@Nombre", usuario.Nombre),
				new SqlParameter("@Apellido", usuario.Apellido),
				new SqlParameter("@Dni", usuario.Dni),
				new SqlParameter("@CUIT", usuario.CUIT),
				new SqlParameter("@Email", usuario.Email),
				new SqlParameter("@NombreUsuario", usuario.NombreUsuario),
				new SqlParameter("@Clave", usuario.Clave),
				new SqlParameter("@CUITEmpresa", usuario.CUITEmpresa)
			};

			usuario.IdUsuario = (int) SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioInsert", parameters);
		}

		/// <summary>
		/// Updates a record in the Usuario table.
		/// </summary>
		public void Update(UsuarioEntidad usuario)
		{
			ValidationUtility.ValidateArgument("usuario", usuario);

			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuario", usuario.IdUsuario),
				new SqlParameter("@IdCondicionFiscal", usuario.IdCondicionFiscal),
				new SqlParameter("@IdUsuarioTipo", usuario.IdUsuarioTipo),
				new SqlParameter("@Nombre", usuario.Nombre),
				new SqlParameter("@Apellido", usuario.Apellido),
				new SqlParameter("@Dni", usuario.Dni),
				new SqlParameter("@CUIT", usuario.CUIT),
				new SqlParameter("@Email", usuario.Email),
				new SqlParameter("@NombreUsuario", usuario.NombreUsuario),
				new SqlParameter("@Clave", usuario.Clave),
				new SqlParameter("@CUITEmpresa", usuario.CUITEmpresa)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdate", parameters);
		}

		/// <summary>
		/// Deletes a record from the Usuario table by its primary key.
		/// </summary>
		public void Delete(int cUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioDelete", parameters);
		}

		/// <summary>
		/// Deletes a record from the Usuario table by a foreign key.
		/// </summary>
		public void DeleteAllByIdCondicionFiscal(int idCondicionFiscal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCondicionFiscal", idCondicionFiscal)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioDeleteAllByIdCondicionFiscal", parameters);
		}

		/// <summary>
		/// Deletes a record from the Usuario table by a foreign key.
		/// </summary>
		public void DeleteAllByCUITEmpresa(int cUITEmpresa)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUITEmpresa", cUITEmpresa)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioDeleteAllByCUITEmpresa", parameters);
		}

		/// <summary>
		/// Deletes a record from the Usuario table by a foreign key.
		/// </summary>
		public void DeleteAllByIdUsuarioTipo(int idUsuarioTipo)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuarioTipo", idUsuarioTipo)
			};

			SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioDeleteAllByIdUsuarioTipo", parameters);
		}

		/// <summary>
		/// Selects a single record from the Usuario table.
		/// </summary>
		public UsuarioEntidad Select(int cUIT, string nombreUsuario)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelect", parameters))
			{
                UsuarioEntidad entidad = new UsuarioEntidad();
                //       

                entidad = Mapeador.MapearFirst<UsuarioEntidad>(dt);



                return entidad;
			}
		}

		

		/// <summary>
		/// Selects all records from the Usuario table.
		/// </summary>
		public List<UsuarioEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelectAll"))
			{
                List<UsuarioEntidad> lista = new List<UsuarioEntidad>();
                lista = Mapeador.Mapear<UsuarioEntidad>(dt);

                return lista;
			}
		}

	

		/// <summary>
		/// Selects all records from the Usuario table by a foreign key.
		/// </summary>
		public List<UsuarioEntidad> SelectAllByIdCondicionFiscal(int idCondicionFiscal)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdCondicionFiscal", idCondicionFiscal)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelectAllByIdCondicionFiscal", parameters))
			{
                List<UsuarioEntidad> lista = new List<UsuarioEntidad>();
                lista = Mapeador.Mapear<UsuarioEntidad>(dt);

                return lista;
			}
		}

		/// <summary>
		/// Selects all records from the Usuario table by a foreign key.
		/// </summary>
		public List<UsuarioEntidad> SelectAllByCUITEmpresa(int cUITEmpresa)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUITEmpresa", cUITEmpresa)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelectAllByCUITEmpresa", parameters))
			{
                List<UsuarioEntidad> lista = new List<UsuarioEntidad>();
                lista = Mapeador.Mapear<UsuarioEntidad>(dt);

                return lista;
			}
		}

		/// <summary>
		/// Selects all records from the Usuario table by a foreign key.
		/// </summary>
		public List<UsuarioEntidad> SelectAllByIdUsuarioTipo(int idUsuarioTipo)
		{
			SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuarioTipo", idUsuarioTipo)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelectAllByIdUsuarioTipo", parameters))
			{
                List<UsuarioEntidad> lista = new List<UsuarioEntidad>();
                lista = Mapeador.Mapear<UsuarioEntidad>(dt);

                return lista;
			}
		}

	

	

	
		#endregion
	}
}
