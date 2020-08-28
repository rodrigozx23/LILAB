using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using test.DA;
using test.Entidades;

namespace test.Service
{
    public class CreditoService
    {
        public CreditoDAO creditoDAO;
        public HistorialsbsDAO historialsbsDAO;

        public CreditoService()
        {
            creditoDAO = new CreditoDAO();
            historialsbsDAO = new HistorialsbsDAO();
        }
        public async Task<List<Credito>> ListarCreditos()
        {
            var rpta = creditoDAO.ListarCreditos();
            return await rpta;
        }

        public async Task<Credito> ActualizarEstadoCredito(Credito entidad)
        {
            var rpta = creditoDAO.ActualizarEstadoCredito(entidad);
            return await rpta;
        }

        public async Task<IEnumerable<HistorialSBS>> ObtenerHistorialSBS(int clienteId)
        {           
            var List = historialsbsDAO.ObtenerHistorialSBS(clienteId);
            return await List;
        }



    }
}
