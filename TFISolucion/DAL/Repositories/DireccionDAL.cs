using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;


namespace TFI.DAL.DAL
{
	public class DireccionDAL
	{

		#region Methods

        /// <summary>
        /// Saves a record to the Direccion table.
        /// </summary>
        public int Insert(DireccionEntidad direccion)
        {
            ValidationUtility.ValidateArgument("direccion", direccion);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Calle", direccion.Calle),
				new SqlParameter("@Numero", direccion.Numero),
				new SqlParameter("@Piso", direccion.Piso),
				new SqlParameter("@Departamento", direccion.Departamento),
				new SqlParameter("@Localidad", direccion.Localidad),
				new SqlParameter("@IdProvincia", direccion.miLocalidad.miProvincia.IdProvincia),
				new SqlParameter("@IdTipoDireccion", direccion.IdTipoDireccion),
                new SqlParameter("@IdLocalidad", direccion.miLocalidad.IdLocalidad)
			};

            var valor = Convert.ToInt32(SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionInsert", parameters));

            return valor;
        }

        /// <summary>
        /// Updates a record in the Direccion table.
        /// </summary>
        public void Update(DireccionEntidad direccion)
        {
            ValidationUtility.ValidateArgument("direccion", direccion);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", direccion.IdDireccion),
				new SqlParameter("@Calle", direccion.Calle),
				new SqlParameter("@Numero", direccion.Numero),
				new SqlParameter("@Piso", direccion.Piso),
				new SqlParameter("@Departamento", direccion.Departamento),
				new SqlParameter("@IdProvincia", direccion.miLocalidad.miProvincia.IdProvincia),
				new SqlParameter("@IdTipoDireccion", direccion.IdTipoDireccion),
                new SqlParameter("@IdLocalidad", direccion.miLocalidad.IdLocalidad)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUpdate", parameters);
        }

        /// <summary>
        /// Deletes a record from the Direccion table by its primary key.
        /// </summary>
        public void Delete(int idDireccion)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionDelete", parameters);
        }




        /// <summary>
        /// Selects a single record from the Direccion table.
        /// </summary>
        public DireccionEntidad Select(int idDireccion)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdDireccion", idDireccion)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelect", parameters))
            {
                DireccionEntidad DireccionEntidad = new DireccionEntidad();

                DireccionEntidad = Mapeador.MapearFirst<DireccionEntidad>(dt);

                return DireccionEntidad;
            }
        }

        public DireccionEntidad TraerDireccionPorIdSucursal(int elIdSucursal)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@elIdSucursal", elIdSucursal)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TraerDireccionPorIdSucursal", parameters))
            {
                DireccionEntidad DireccionEntidad = new DireccionEntidad();
                DireccionEntidad = Mapeador.MapearFirst<DireccionEntidad>(dt);
                return DireccionEntidad;
            }
        }


        /// <summary>
        /// Selects all records from the Direccion table.
        /// </summary>
        public List<DireccionEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelectAll"))
            {
                List<DireccionEntidad> direccionEntidadList = new List<DireccionEntidad>();

                direccionEntidadList = Mapeador.Mapear<DireccionEntidad>(dt);

                return direccionEntidadList;
            }
        }


        /// <summary>
        /// Selects all records from the Direccion table by a foreign key.
        /// </summary>
        public List<DireccionEntidad> SelectAllByIdProvincia(int idProvincia)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdProvincia", idProvincia)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelectAllByIdProvincia", parameters))
            {
                List<DireccionEntidad> direccionEntidadList = new List<DireccionEntidad>();

                direccionEntidadList = Mapeador.Mapear<DireccionEntidad>(dt);

                return direccionEntidadList;
            }
        }



        public List<DireccionEntidad> SelectDireccionesDeUsuarioActuales(string elCUIT, string elNombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@elCUIT", elCUIT),
                new SqlParameter("@elNombreUsuario", elNombreUsuario)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectDireccionesDeUsuarioActuales", parameters))
            {
                List<DireccionEntidad> unasDirecciones = new List<DireccionEntidad>();
                unasDirecciones = MapearMuchos(dt);
                return unasDirecciones;
            }
        }



        private List<DireccionEntidad> MapearMuchos(DataSet ds)
        {
            List<DireccionEntidad> ResUnosItem = new List<DireccionEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    DireccionEntidad unItem = new DireccionEntidad();

                    unItem.IdDireccion = (int)row["IdDireccion"];
                    unItem.Calle = row["Calle"].ToString();
                    unItem.Numero = (int)row["Numero"];
                    if (row["Piso"].ToString() != "")
                    {
                        int aux = (int)row["Piso"];
                        unItem.Piso = aux;
                    }
                        
                    unItem.Departamento = row["Departamento"].ToString();
                    if (row["FecBaja"].ToString() != "")
                        unItem.FecBaja = DateTime.Parse(row["FecBaja"].ToString());
                    unItem.Predeterminada = (bool)row["Predeterminada"];
                    unItem.IdTipoDireccion = (int)row["IdTipoDireccion"];
                    unItem.miLocalidad = new Localidad();
                    unItem.miLocalidad.IdLocalidad = (int)row["IdLocalidad"];
                    unItem.miLocalidad.DescripcionLocalidad = row["DescripcionLocalidad"].ToString();
                    unItem.miLocalidad.miProvincia = new ProvinciaEntidad();
                    unItem.miLocalidad.miProvincia.IdProvincia = (int)row["IdProvincia"];
                    unItem.miLocalidad.miProvincia.DescripcionProvincia = row["DescripcionProvincia"].ToString();

                    ResUnosItem.Add(unItem);
                }
                return ResUnosItem;
            }
            catch (Exception es)
            {
                throw;
            }

        }





		#endregion
	}
}
