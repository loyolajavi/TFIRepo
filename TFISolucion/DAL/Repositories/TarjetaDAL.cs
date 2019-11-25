using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; 
using TFI.Entidades;
using System.Linq;

namespace TFI.DAL.DAL
{
	public class TarjetaDAL
	{

        /// <summary>
        /// Saves a record to the Tarjeta table.
        /// </summary>
        public void Insert(TarjetaEntidad tarjeta)
        {
            ValidationUtility.ValidateArgument("tarjeta", tarjeta);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", tarjeta.miTipoTarjeta.IdTipoTarjeta),
				new SqlParameter("@cuit", tarjeta.miUsuario.CUIT),
				new SqlParameter("@NombreUsuario", tarjeta.miUsuario.NombreUsuario),
				new SqlParameter("@Titular", tarjeta.Titular),
				new SqlParameter("@Vencimiento", tarjeta.Vencimiento),
				new SqlParameter("@Numero", tarjeta.Numero),
				new SqlParameter("@CodSeguridad", tarjeta.CodSeguridad),
				new SqlParameter("@FecBaja", tarjeta.FecBaja),
                new SqlParameter("@Predeterminada", tarjeta.Predeterminada)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaInsert", parameters);
        }

        public void TarjetaSetearPredeterminada(int elIdTarjeta)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@elIdTarjeta", elIdTarjeta)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSetearPredeterminada", parameters);
        }


        /// <summary>
        /// Updates a record in the Tarjeta table.
        /// </summary>
        public void Update(TarjetaEntidad tarjeta)
        {
            ValidationUtility.ValidateArgument("tarjeta", tarjeta);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTarjeta", tarjeta.IdTarjeta),
				new SqlParameter("@IdTipoTarjeta", tarjeta.miTipoTarjeta.IdTipoTarjeta),
				new SqlParameter("@cuit", tarjeta.miUsuario.CUIT),
				new SqlParameter("@NombreUsuario", tarjeta.miUsuario.NombreUsuario),
				new SqlParameter("@Titular", tarjeta.Titular),
				new SqlParameter("@Vencimiento", tarjeta.Vencimiento),
				new SqlParameter("@Numero", tarjeta.Numero),
				new SqlParameter("@CodSeguridad", tarjeta.CodSeguridad),
				new SqlParameter("@FecBaja", tarjeta.FecBaja)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaUpdate", parameters);
        }

        /// <summary>
        /// Deletes a record from the Tarjeta table by its primary key.
        /// </summary>
        public void Delete(int idTarjeta)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTarjeta", idTarjeta)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaDelete", parameters);
        }

        /// <summary>
        /// Deletes a record from the Tarjeta table by a foreign key.
        /// </summary>
        public void DeleteAllByIdTipoTarjeta(int idTipoTarjeta)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", idTipoTarjeta)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaDeleteAllByIdTipoTarjeta", parameters);
        }

        /// <summary>
        /// Deletes a record from the Tarjeta table by a foreign key.
        /// </summary>
        public void DeleteAllByCUIT_NombreUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaDeleteAllByCUIT_NombreUsuario", parameters);
        }

        /// <summary>
        /// Selects a single record from the Tarjeta table.
        /// </summary>
        public TarjetaEntidad Select(int idTarjeta)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTarjeta", idTarjeta)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelect", parameters))
            {
                TarjetaEntidad unTarjetaEntidad = new TarjetaEntidad();

                unTarjetaEntidad = Mapeador.MapearFirst<TarjetaEntidad>(dt);

                return unTarjetaEntidad;
            }
        }

        /// <summary>
        /// Selects a single record from the Tarjeta table.
        /// </summary>
        public TarjetaEntidad SelectByNumero(Int64 numero, string cuit)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@Numero", numero),
                new SqlParameter("@CUIT", cuit)
			};

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelectByNumero", parameters))
            {
                TarjetaEntidad unTarjetaEntidad = new TarjetaEntidad();

                unTarjetaEntidad = MapearMuchos(ds).First();

                return unTarjetaEntidad;
            }
        }



        /// <summary>
        /// Selects all records from the Tarjeta table.
        /// </summary>
        public List<TarjetaEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelectAll"))
            {
                List<TarjetaEntidad> tarjetaEntidadList = new List<TarjetaEntidad>();

                tarjetaEntidadList = Mapeador.Mapear<TarjetaEntidad>(dt);

                return tarjetaEntidadList;
            }
        }


        /// <summary>
        /// Selects all records from the Tarjeta table by a foreign key.
        /// </summary>
        public List<TarjetaEntidad> SelectAllByIdTipoTarjeta(int idTipoTarjeta)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdTipoTarjeta", idTipoTarjeta)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelectAllByIdTipoTarjeta", parameters))
            {
                List<TarjetaEntidad> tarjetaEntidadList = new List<TarjetaEntidad>();

                tarjetaEntidadList = Mapeador.Mapear<TarjetaEntidad>(dt);

                return tarjetaEntidadList;
            }
        }

        /// <summary>
        /// Selects all records from the Tarjeta table by a foreign key.
        /// </summary>
        public List<TarjetaEntidad> SelectAllByCUIT_NombreUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@cuit", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaSelectAllByCUIT_NombreUsuario", parameters))
            {
                List<TarjetaEntidad> tarjetaEntidadList = new List<TarjetaEntidad>();

                tarjetaEntidadList = MapearMuchos(ds);

                return tarjetaEntidadList;
            }
        }



        private List<TarjetaEntidad> MapearMuchos(DataSet ds)
        {
            List<TarjetaEntidad> ResUnosItem = new List<TarjetaEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    TarjetaEntidad unItem = new TarjetaEntidad();

                    unItem.IdTarjeta = (int)row["IdTarjeta"];
                    unItem.miTipoTarjeta = new TipoTarjetaEntidad();
                    unItem.miTipoTarjeta.IdTipoTarjeta = (int)row["IdTipoTarjeta"];
                    unItem.miUsuario = new UsuarioEntidad();
                    unItem.miUsuario.CUIT = row["CUIT"].ToString();
                    unItem.miUsuario.NombreUsuario = row["NombreUsuario"].ToString();
                    unItem.Titular = row["Titular"].ToString();
                    unItem.Vencimiento = DateTime.Parse(row["Vencimiento"].ToString());
                    unItem.Numero = (long)row["Numero"];
                    unItem.CodSeguridad = (int)row["CodSeguridad"];
                    unItem.Predeterminada = (bool)row["Predeterminada"];
                    if (row["FecBaja"].ToString() != "")
                        unItem.FecBaja = DateTime.Parse(row["FecBaja"].ToString());

                    ResUnosItem.Add(unItem);
                }
                return ResUnosItem;
            }
            catch (Exception es)
            {
                throw;
            }

        }


        private TarjetaEntidad Mapear(DataSet ds)
        {
            try
            {
                TarjetaEntidad unItem = new TarjetaEntidad();

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    unItem.IdTarjeta = (int)row["IdTarjeta"];
                    unItem.miTipoTarjeta = new TipoTarjetaEntidad();
                    unItem.miTipoTarjeta.IdTipoTarjeta = (int)row["IdTipoTarjeta"];
                    unItem.miUsuario = new UsuarioEntidad();
                    unItem.miUsuario.CUIT = row["CUIT"].ToString();
                    unItem.miUsuario.NombreUsuario = row["NombreUsuario"].ToString();
                    unItem.Titular = row["Titular"].ToString();
                    unItem.Vencimiento = DateTime.Parse(row["Vencimiento"].ToString());
                    unItem.Numero = (long)row["Numero"];
                    unItem.CodSeguridad = (int)row["CodSeguridad"];
                    unItem.Predeterminada = (bool)row["Predeterminada"];
                    if (row["FecBaja"].ToString() != "")
                        unItem.FecBaja = DateTime.Parse(row["FecBaja"].ToString());
                }
                return unItem;
            }
            catch (Exception es)
            {
                throw;
            }

        }



	}
}
