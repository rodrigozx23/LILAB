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
        public async Task<List<Credito>> ListarCreditos(string cnn)
        {
            var rpta = creditoDAO.ListarCreditos(cnn);
            return await rpta;
        }

        public async Task<Credito> ActualizarEstadoCredito(Credito entidad, string cnn)
        {
            var rpta = creditoDAO.ActualizarEstadoCredito(entidad, cnn);
            return await rpta;
        }

        public async Task<IEnumerable<HistorialSBS>> ObtenerHistorialSBS(int clienteId, string cnn)
        {           
            var List = historialsbsDAO.ObtenerHistorialSBS(clienteId, cnn);
            return await List;
        }
    }
}
