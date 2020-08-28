using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using test.Entidades;

namespace test.DA
{
    public class HistorialsbsDAO
    {

        public async Task<List<HistorialSBS>> ObtenerHistorialSBS(int idcliente, string cnn)
        {
            List<HistorialSBS> rpta = new List<HistorialSBS>();
            try
            {
                MySqlConnection conn = new MySqlConnection(cnn);
                await conn.OpenAsync();
                using (var cmd = new MySqlCommand("CALL SP_LISTADO_SBS (@PEI_ID_CLIENTE);", conn))
                {
                    cmd.Parameters.AddWithValue("@PEI_ID_CLIENTE", idcliente);
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            HistorialSBS hsbs = new HistorialSBS();
                            hsbs.HistorialID = (int)reader["idHistorial_Deudas"];
                            hsbs.ClienteID = (int)reader["IdCliente"];
                            hsbs.NombreCliente = reader["Nombre"].ToString();
                            hsbs.Total = (Double)reader["Total"];
                            hsbs.fecha_credito = (DateTime)reader["Fecha_Credito"];
                            hsbs.fecha_pago = reader["Fecha_Pago"] == System.DBNull.Value ? null : (DateTime?)reader["Fecha_Pago"]; 
                            rpta.Add(hsbs);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Write("Error" + ex.ToString());
            }
            return rpta;
        }
    }
}
