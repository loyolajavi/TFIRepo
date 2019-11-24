using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia;
using TFI.Entidades;
using TFI.Entidades.Servicios.Permisos;


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

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
			    {
				    new SqlParameter("@Nombre", usuario.Nombre),
				    new SqlParameter("@Apellido", usuario.Apellido),
				    new SqlParameter("@CUIT", usuario.CUIT),
				    new SqlParameter("@Email", usuario.Email),
				    new SqlParameter("@NombreUsuario", usuario.NombreUsuario)
			    };

                SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdateDatosPersonales", parameters);
            }
            catch (Exception es)
            {
                throw;
            }


        }


        public void UsuarioUpdateDatosPersonalesConDNI(UsuarioEntidad usuario)
        {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Nombre", usuario.Nombre),
				new SqlParameter("@Apellido", usuario.Apellido),
				new SqlParameter("@Email", usuario.Email),
                new SqlParameter("@NroIdentificacion", usuario.NroIdentificacion),
                new SqlParameter("@IdUsuario", usuario.IdUsuario)
				
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdateDatosPersonalesConDNI", parameters);
        }


        public void UsuarioUpdateNombreUsuario(UsuarioEntidad usuario)
        {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@NombreUsuario", usuario.NombreUsuario),
                new SqlParameter("@IdUsuario", usuario.IdUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdateNombreUsuario", parameters);
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
        public UsuarioEntidad SelectUserByClaveNombreUsuario(string Clave, string nombreUsuario, string cuit)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Clave", Clave),
                new SqlParameter("@NombreUsuario", nombreUsuario),
                new SqlParameter("@Cuit", cuit)
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
        public List<UsuarioEntidad> UsuarioSelectAllByIdUsuarioTipo_CUIT(int idUsuarioTipo, string CUIT)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuarioTipo", idUsuarioTipo),
                new SqlParameter("@CUIT", CUIT)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelectAllByIdUsuarioTipo_CUIT", parameters))
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


        public UsuarioEntidad UsuarioSelectByIdUsuario(int idUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuario", idUsuario)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioSelectByIdUsuario", parameters))
            {
                UsuarioEntidad entidad = new UsuarioEntidad();

                entidad = Mapeador.MapearFirst<UsuarioEntidad>(dt);

                return entidad;
            }
        }

        public void UsuarioDeleteSeleccionadosByIdUsuario(int idUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdUsuario", idUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioDeleteSeleccionadosByIdUsuario", parameters);
        }



        public List<IFamPat> UsuarioTraerPermisos(string elNomUsuario, string elCUIT)
        {

            List<IFamPat> unosPermisos = new List<IFamPat>();

            SqlParameter[] parameters = new SqlParameter[]
			{
                new SqlParameter("@elNomUsuario", elNomUsuario),
                new SqlParameter("@elCUIT", elCUIT)
			};
            SqlParameter[] parameters2 = new SqlParameter[]
			{
                new SqlParameter("@elNomUsuario", elNomUsuario),
                new SqlParameter("@elCUIT", elCUIT)
			};

            try
            {
                //Traigo las familias
                using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTraerFamilias", parameters))
                {
                    List<IFamPat> unasFamilias = new List<IFamPat>();
                    unasFamilias = MapearFamilias(ds);

                    if (unasFamilias != null && unasFamilias.Count > 0)
                        unosPermisos.AddRange(unasFamilias);
                }
                //Traigo las patentes
                using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTraerPatentes", parameters2))
                {
                    List<IFamPat> unasPatentes = new List<IFamPat>();
                    unasPatentes = MapearPatentes(ds);
                    unosPermisos.AddRange(unasPatentes);
                }

                return unosPermisos;
            }
            catch (Exception es)
            {
                throw;
            }
        }



        public static List<IFamPat> MapearFamilias(DataSet ds)
        {
            List<IFamPat> ResElementosFamPat = new List<IFamPat>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    IFamPat unaFamilia = new Familia();
                    unaFamilia.IdIFamPat = (int)row["IdFamilia"];
                    unaFamilia.NombreIFamPat = row["NombreFamilia"].ToString();
                    ResElementosFamPat.Add(unaFamilia);
                }
                return ResElementosFamPat;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public static List<IFamPat> MapearPatentes(DataSet ds)
        {
            List<IFamPat> ResElementosFamPat = new List<IFamPat>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    IFamPat unaPatente = new Patente();
                    unaPatente.IdIFamPat = (int)row["IdPatente"];
                    unaPatente.NombreIFamPat = row["NombrePatente"].ToString();
                    ResElementosFamPat.Add(unaPatente);
                }
                return ResElementosFamPat;
            }
            catch (Exception es)
            {
                throw;
            }
        }


        #endregion
    }
}
