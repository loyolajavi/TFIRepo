using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.FUNCIONES.Persistencia; using TFI.Entidades;

namespace TFI.DAL.DAL
{
	public class PedidoDAL
	{

        /// <summary>
        /// Saves a record to the Pedido table.
        /// </summary>
        public int Insert(PedidoEntidad pedido)
        {
            ValidationUtility.ValidateArgument("pedido", pedido);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@FechaPedido", pedido.FechaPedido),
				new SqlParameter("@FechaFinPedido", pedido.FechaFinPedido),
				new SqlParameter("@NombreUsuario", pedido.miUsuario.NombreUsuario),
				new SqlParameter("@IdFormaEntrega", pedido.miFormaEntrega.IdFormaEntrega),
				new SqlParameter("@CUIT", pedido.miUsuario.CUIT),
				new SqlParameter("@NumeroTracking", pedido.NumeroTracking),
				new SqlParameter("@DireccionEntrega", pedido.miDireccionEntrega.IdDireccion),
                new SqlParameter("@NroPedido", pedido.NroPedido)
			};

            var result = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoInsert", parameters);

            return Decimal.ToInt32(result);
        }

        /// <summary>
        /// Updates a record in the Pedido table.
        /// </summary>
        public void Update(PedidoEntidad pedido)
        {
            ValidationUtility.ValidateArgument("pedido", pedido);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", pedido.IdPedido),
				new SqlParameter("@FechaPedido", pedido.FechaPedido),
				new SqlParameter("@FechaFinPedido", pedido.FechaFinPedido),
				new SqlParameter("@NombreUsuario", pedido.miUsuario.NombreUsuario),
				new SqlParameter("@IdFormaEntrega", pedido.miFormaEntrega.IdFormaEntrega),
				new SqlParameter("@CUIT", pedido.miUsuario.CUIT),
				new SqlParameter("@NumeroTracking", pedido.NumeroTracking),
				new SqlParameter("@DireccionEntrega", pedido.miDireccionEntrega.IdDireccion),
                new SqlParameter("@NroPedido", pedido.NroPedido)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoUpdate", parameters);
        }

        /// <summary>
        /// Deletes a record from the Pedido table by its primary key.
        /// </summary>
        public void Delete(int idPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoDelete", parameters);
        }

        


        /// <summary>
        /// Selects a single record from the Pedido table.
        /// </summary>
        public PedidoEntidad Select(int idPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoSelect", parameters))
            {
                PedidoEntidad PedidoEntidad = new PedidoEntidad();
                PedidoEntidad = MapearPedidoEntidad(dt);
                return PedidoEntidad;
            }
        }

        /// <summary>
        /// Selects a single record from the Pedido table.
        /// </summary>
        public PedidoEntidad SelectByCUIT_NroPedido(string cuit, Int64 nropedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cuit),
                new SqlParameter("@NroPedido", nropedido)
			};

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoSelectByCUIT_NroPedido", parameters))
            {
                PedidoEntidad PedidoEntidad = new PedidoEntidad();
                PedidoEntidad = MapearPedidoEntidad(ds);
                return PedidoEntidad;
            }
        }

        public PedidoEntidad PedidoSelectByCUIT_IDPedido(string elCuit, Int64 elIdPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@elCuit", elCuit),
                new SqlParameter("@elIdPedido", elIdPedido)
			};

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoSelectByCUIT_IDPedido", parameters))
            {
                PedidoEntidad PedidoEntidad = new PedidoEntidad();
                PedidoEntidad = MapearPedidoEntidad(ds);
                return PedidoEntidad;
            }
        }

        private PedidoEntidad MapearPedidoEntidad(DataSet ds)
        {
            PedidoEntidad unPedido = new PedidoEntidad();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                unPedido.IdPedido = (int)row["IdPedido"];
                unPedido.FechaPedido = DateTime.Parse(row["FechaPedido"].ToString());
                if (row["FechaFinPedido"].ToString() != "")
                    unPedido.FechaFinPedido = DateTime.Parse(row["FechaFinPedido"].ToString());
                unPedido.miUsuario = new UsuarioEntidad();
                unPedido.miUsuario.NombreUsuario = row["NombreUsuario"].ToString();
                unPedido.miFormaEntrega = new FormaEntregaEntidad();
                unPedido.miFormaEntrega.IdFormaEntrega = (int)row["IdFormaEntrega"];
                unPedido.miFormaEntrega.DescripcionFormaEntrega = row["DescripcionFormaEntrega"].ToString();
                unPedido.miUsuario.CUIT = row["CUIT"].ToString();
                unPedido.NumeroTracking = row["NumeroTracking"].ToString();
                unPedido.miDireccionEntrega = new DireccionEntidad();
                unPedido.miDireccionEntrega.IdDireccion = (int)row["DireccionEntrega"];
                if (row["FecBaja"].ToString() != "")
                    unPedido.FecBaja = DateTime.Parse(row["FecBaja"].ToString());
                unPedido.NroPedido = (Int64)row["NroPedido"];
            }
            return unPedido;
        }

        private List<PedidoEntidad> MapearMuchosPedidoEntidad(DataSet ds)
        {
            List<PedidoEntidad> ResUnosPedidos = new List<PedidoEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    PedidoEntidad unPedido = new PedidoEntidad();

                    unPedido.IdPedido = (int)row["IdPedido"];
                    unPedido.FechaPedido = DateTime.Parse(row["FechaPedido"].ToString());
                    if (row["FechaFinPedido"].ToString() != "")
                        unPedido.FechaFinPedido = DateTime.Parse(row["FechaFinPedido"].ToString());
                    unPedido.miUsuario = new UsuarioEntidad();
                    unPedido.miUsuario.NombreUsuario = row["NombreUsuario"].ToString();
                    unPedido.miFormaEntrega = new FormaEntregaEntidad();
                    unPedido.miFormaEntrega.IdFormaEntrega = (int)row["IdFormaEntrega"];
                    unPedido.miFormaEntrega.DescripcionFormaEntrega = row["DescripcionFormaEntrega"].ToString();
                    unPedido.miUsuario.CUIT = row["CUIT"].ToString();
                    unPedido.NumeroTracking = row["NumeroTracking"].ToString();
                    unPedido.miDireccionEntrega = new DireccionEntidad();
                    unPedido.miDireccionEntrega.IdDireccion = (int)row["DireccionEntrega"];
                    if (row["FecBaja"].ToString() != "")
                        unPedido.FecBaja = DateTime.Parse(row["FecBaja"].ToString());
                    unPedido.NroPedido = (Int64)row["NroPedido"];

                    ResUnosPedidos.Add(unPedido);
                }
                return ResUnosPedidos;
            }
            catch (Exception es)
            {
                throw;
            }
            
        }


        /// <summary>
        /// Selects all records from the Pedido table by a foreign key.
        /// </summary>
        public List<PedidoEntidad> SelectAllByCUIT(string cuit)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cuit)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoSelectAllByCUIT", parameters))
            {
                List<PedidoEntidad> pedidoEntidadList = new List<PedidoEntidad>();
                pedidoEntidadList = MapearMuchosPedidoEntidad(dt);
                return pedidoEntidadList;
            }
        }



        ///// <summary>
        ///// Selects all records from the Pedido table by a foreign key.
        ///// </summary>
        //public List<PedidoEntidad> SelectAllByIdFormaEntrega(int idFormaEntrega)
        //{
        //    SqlParameter[] parameters = new SqlParameter[]
        //    {
        //        new SqlParameter("@IdFormaEntrega", idFormaEntrega)
        //    };

        //    using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoSelectAllByIdFormaEntrega", parameters))
        //    {
        //        List<PedidoEntidad> pedidoEntidadList = new List<PedidoEntidad>();

        //        pedidoEntidadList = Mapeador.Mapear<PedidoEntidad>(dt);

        //        return pedidoEntidadList;
        //    }
        //}

        /// <summary>
        /// Selects all records from the Pedido table by a foreign key.
        /// </summary>
        public List<PedidoEntidad> SelectAllByCUIT_NombreUsuario(string cuit, string nombreUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@CUIT", cuit),
				new SqlParameter("@NombreUsuario", nombreUsuario)
			};

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoSelectAllByCUIT_NombreUsuario", parameters))
            {
                List<PedidoEntidad> pedidoEntidadList = new List<PedidoEntidad>();
                pedidoEntidadList = MapearMuchosPedidoEntidad(dt);
                return pedidoEntidadList;
            }
        }


        public void PedidoTraerEstadoActual(PedidoEntidad elPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", elPedido.IdPedido)
			};

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoTraerEstadoActual", parameters))
            {
                MapearEstadoActualPedido(elPedido, ds);
            }
        }


        private void MapearEstadoActualPedido(PedidoEntidad elPedido, DataSet ds)
        {
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                switch ((int)row["IdEstadoPedido"])
                {
                    case 1:
                        elPedido.DefinirEstado(new Entidades.StatePatron.StatePendientePago());

                        //.CambiarEstado(TFI.Entidades.StatePatron.StatePendientePago.Instanciar());
                        break;
                    case 2:
                        elPedido.DefinirEstado(new Entidades.StatePatron.StatePago());
                        break;
                    case 3:
                        elPedido.DefinirEstado(new Entidades.StatePatron.StateEnCamino());
                        break;
                    case 4:
                        elPedido.DefinirEstado(new Entidades.StatePatron.StateListoParaRetirar());
                        break;
                    case 5:
                        elPedido.DefinirEstado(new Entidades.StatePatron.StateEntregado());
                        break;
                    case 6:
                        elPedido.DefinirEstado(new Entidades.StatePatron.StateCancelado());
                        break;
                }
                elPedido.VerEstadoActual().DescripcionEstadoPedido = row["DescripcionEstadoPedido"].ToString();
                elPedido.VerEstadoActual().IdEstadoPedido = (int)row["IdEstadoPedido"];
            }
        }



        public void PedidoActualizarNroTracking(int elIdPedido, string elNroTracking)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@elIdPedido", elIdPedido),
                new SqlParameter("@elNroTracking", elNroTracking)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoActualizarNroTracking", parameters);
        }


	}
}
