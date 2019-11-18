using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TFI.Entidades;
using TFI.HelperDAL;

namespace TFI.DAL.DAL
{
    public class PedidoEstadoPedidoDAL
    {

        //ESTE METODO ES OK QUE ESTE INCLUSO YA CON STATEPEDIDO
        public void Insert(PedidoEstadoPedidoEntidad pedidoEstadoPedido)
        {
            ValidationUtility.ValidateArgument("pedidoEstadoPedido", pedidoEstadoPedido);

            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", pedidoEstadoPedido.IdPedido),
				new SqlParameter("@IdEstadoPedido", pedidoEstadoPedido.IdEstadoPedido),
				new SqlParameter("@Fecha", pedidoEstadoPedido.Fecha),
				new SqlParameter("@FecBaja", pedidoEstadoPedido.FecBaja)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoInsert", parameters);
        }



        public void Delete(int idPedido, int idEstadoPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoDelete", parameters);
        }

        public void DeleteAllByIdEstadoPedido(int idEstadoPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoDeleteAllByIdEstadoPedido", parameters);
        }

        public void DeleteAllByIdPedido(int idPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoDeleteAllByIdPedido", parameters);
        }

        public PedidoEstadoPedidoEntidad Select(int idPedido, int idEstadoPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido),
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelect", parameters))
            {
                PedidoEstadoPedidoEntidad unPedidoEstadoPedidoEntidad = new PedidoEstadoPedidoEntidad();

                unPedidoEstadoPedidoEntidad = Mapeador.MapearFirst<PedidoEstadoPedidoEntidad>(dt);

                return unPedidoEstadoPedidoEntidad;
            }
        }

        public PedidoEstadoPedidoEntidad PedidoUltimoEstadoSelect(int idPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoUltimoEstadoSelect", parameters))
            {
                PedidoEstadoPedidoEntidad unPedidoEstadoPedidoEntidad = new PedidoEstadoPedidoEntidad();

                unPedidoEstadoPedidoEntidad = Mapeador.MapearFirst<PedidoEstadoPedidoEntidad>(dt);

                return unPedidoEstadoPedidoEntidad;
            }
        }

        public List<PedidoEstadoPedidoEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelectAll"))
            {
                List<PedidoEstadoPedidoEntidad> pedidoEstadoPedidoEntidadList = new List<PedidoEstadoPedidoEntidad>();

                pedidoEstadoPedidoEntidadList = Mapeador.Mapear<PedidoEstadoPedidoEntidad>(dt);

                return pedidoEstadoPedidoEntidadList;
            }
        }

        public List<PedidoEstadoPedidoEntidad> SelectAllByIdEstadoPedido(int idEstadoPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdEstadoPedido", idEstadoPedido)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelectAllByIdEstadoPedido", parameters))
            {
                List<PedidoEstadoPedidoEntidad> pedidoEstadoPedidoEntidadList = new List<PedidoEstadoPedidoEntidad>();

                pedidoEstadoPedidoEntidadList = Mapeador.Mapear<PedidoEstadoPedidoEntidad>(dt);

                return pedidoEstadoPedidoEntidadList;
            }
        }

        public List<PedidoEstadoPedidoEntidad> SelectAllByIdPedido(int idPedido)
        {
            SqlParameter[] parameters = new SqlParameter[]
			{
				new SqlParameter("@IdPedido", idPedido)
			};

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PedidoEstadoPedidoSelectAllByIdPedido", parameters))
            {
                List<PedidoEstadoPedidoEntidad> pedidoEstadoPedidoEntidadList = new List<PedidoEstadoPedidoEntidad>();

                pedidoEstadoPedidoEntidadList = Mapeador.Mapear<PedidoEstadoPedidoEntidad>(dt);

                return pedidoEstadoPedidoEntidadList;
            }
        }
    }
}