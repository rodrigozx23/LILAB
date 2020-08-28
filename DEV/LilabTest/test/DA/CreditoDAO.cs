using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using test.Entidades;

namespace test.DA
{
    public class CreditoDAO
    {
        public async Task<List<Credito>> ListarCreditos()
        {
            List<Credito> rpta = new List<Credito>();
        
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;password=root;database=bdtest");
                await conn.OpenAsync();
                using (var cmd = new MySqlCommand("CALL SP_LISTAR_CREDITOS();", conn))
                {
                    using (var reader = await cmd.ExecuteReaderAsync()) 
                    {
                        while (await reader.ReadAsync())               
                        {
                            Credito cre = new Credito();
                            cre.CreditoID = (int)reader["idCredito"];
                            cre.ClienteID = (int)reader["IdCliente"];
                            cre.NombreCliente = reader["nombre"].ToString();
                            cre.Monto = (Double)reader["Total"];
                            cre.Estado = reader["Estado"].ToString();
                            rpta.Add(cre);
                        }
                    }
                }                      
            return rpta; 
        }
        public async Task<Credito> ActualizarEstadoCredito(Credito entidad)
        {
            Credito rpta = new Credito();
            try { 
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;password=root;database=bdtest");
            await conn.OpenAsync();
            using (var cmd = new MySqlCommand("CALL SP_ACTUALIZAR_ESTADO_CREDITO (@PEI_ID_CREDITO, @PEV_ESTADO);", conn))
            {
                cmd.Parameters.AddWithValue("@PEI_ID_CREDITO", entidad.CreditoID);
                cmd.Parameters.AddWithValue("@PEV_ESTADO", entidad.Estado);
                cmd.ExecuteNonQuery();
            }
            }
            catch(Exception ex){
                Console.Write("Error" + ex.ToString());
            }
            return entidad;
        }
    }
}
