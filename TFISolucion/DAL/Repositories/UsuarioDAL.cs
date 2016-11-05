using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.HelperDAL;
using TFI.Entidades;


namespace TFI.DAL.DAL
{
    public class UsuarioDAL
    {

        #region Methods



        //Se agrego este metodo para actualizar los datos personales el usuario
        /// <summary>
        /// Metodo que actualiza los datos personales del usuario(nombre,apellido,cuit,email,nombreusuario
        /// </summary>
        /// <param name="usuario"></param>
        public void UpdateDatosPersonales(UsuarioEntidad usuario)
        {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Nombre", usuario.Nombre),
				new SqlParameter("@Apellido", usuario.Apellido),
				new SqlParameter("@cuit", usuario.CUIT),
				new SqlParameter("@Email", usuario.Email),
				new SqlParameter("@NombreUsuario", usuario.NombreUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdateDatosPersonales", parameters);
        }


        public void UpdateUsuarioContraseña(UsuarioEntidad usuario)
        {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", usuario.CUIT),
				new SqlParameter("@Clave", usuario.Clave),
				new SqlParameter("@NombreUsuario", usuario.NombreUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdateClave", parameters);
        }


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
				new SqlParameter("@NroIdentificacion", usuario.NroIdentificacion),
				new SqlParameter("@CUIT", usuario.CUIT),
				new SqlParameter("@Email", usuario.Email),
				new SqlParameter("@NombreUsuario", usuario.NombreUsuario),
				new SqlParameter("@Clave", usuario.Clave),
			};

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioInsert", parameters);
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
				new SqlParameter("@NroIdentificacion", usuario.NroIdentificacion),
				new SqlParameter("@CUIT", usuario.CUIT),
				new SqlParameter("@Email", usuario.Email),
				new SqlParameter("@NombreUsuario", usuario.NombreUsuario),
				new SqlParameter("@Clave", usuario.Clave),
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdate", parameters);
        }

        /// <summary>
        /// Deletes a record from the Usuario table by its primary key.
        /// </summary>
        public void Delete(string CUIT, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioDelete", parameters);
        }

        /// <summary>
        /// Deletes a record from the Usuario table by its primary key.
        /// </summary>
        public UsuarioEntidad SelectUserByClaveNombreUsuario(string Clave, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Clave", Clave),
                new SqlParameter("@NombreUsuario", nombreUsuario)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "[UsuarioSelectByNombreUsuarioClave]", parameters))
            {
                UsuarioEntidad entidad = new UsuarioEntidad();
                entidad = Mapeador.MapearFirst<UsuarioEntidad>(dt);
                return entidad;
            }
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
        public void DeleteAllByCUIT(string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioDeleteAllByCUIT", parameters);
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
        public UsuarioEntidad Select(string CUIT, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelect", parameters))
            {
                UsuarioEntidad entidad = new UsuarioEntidad();

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
        public List<UsuarioEntidad> SelectAllByCUIT(string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelectAllByCUIT", parameters))
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

        public List<UsuarioEntidad> EmpresasConMasPedidos(string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", CUIT)
				
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "rankingEmpresas", parameters))
            {
                List<UsuarioEntidad> lista = new List<UsuarioEntidad>();
                lista = Mapeador.Mapear<UsuarioEntidad>(dt);

                return lista;
            }
        }




        #endregion
    }
}
