using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using test.Entidades;
using test.Service;

namespace test.Controllers
{
    [ApiController]
    public class CreditoController : ControllerBase
    {
        private readonly string connString;

        private CreditoService creditoService;

        public CreditoController(IConfiguration _config) 
        {     
            creditoService = new CreditoService();
            connString = _config.GetConnectionString("Default");
        }

        [HttpPost]
        [ActionName("ActualizarEstadoCredito")]
        [Route("Credito/ActualizarEstadoCredito")]
        public async Task<Credito> PostActualizarEstadoCredito(int creditoID, string accion)
        {
            Credito ent = new Credito();
            try
            {
                ent.CreditoID = creditoID;

                if (accion == "APROBAR")
                { 
                   ent.Estado = "APROBAR"; 
                }
                else if (accion == "RECHAZAR") 
                {
                    ent.Estado = "RECHAZAR";
                }
               
                var lista = creditoService.ActualizarEstadoCredito(ent, connString);
                return await lista;
            }
            catch (Exception e)
            {
                ent = null;
                Console.Write("Error" + e.ToString());
            }
            return ent;
        }


        [HttpGet]
        [ActionName("ListarCreditos")]
        [Route("Credito/ListarCreditos")]
        public async Task<List<Credito>> GetListaSolicitudeCredito()
        {
            List<Credito> ent = new List<Credito>();
            try
            {
                var lista = creditoService.ListarCreditos(connString);
                return await lista;
            }
            catch (Exception e)
            {
                ent = null;
                Console.Write("Error" + e.ToString());
            }
            return ent;
        }
        
        [HttpGet]
        [ActionName("Sentinel")]
        [Route("Credito/ObtenerIndicadorSBS")]
        public async Task<Sentinel> GetObtenerIndiceSentinel(int clienteID)
        {
            Sentinel sentinel = new Sentinel();

            try
            {          
                var lista = creditoService.ObtenerHistorialSBS(clienteID, connString);

                if (lista.Result != null)
                {
                    var totalCreditosPositivos = from file in lista.Result
                                                 where file.fecha_pago != null
                                                 select new { total = file.Total };

                    var totalCreditosNegativo = from file in lista.Result
                                                where file.fecha_pago == null
                                                select new { total = file.Total };

                    var total = from file in lista.Result
                                select new { total = file.Total };

                    sentinel.ClienteID = clienteID;
                    sentinel.CantidadCreditos = total.Count();
                    sentinel.CantidadCreditosNegativos = totalCreditosNegativo.Count();
                    sentinel.CantidadCreditosPositivos = totalCreditosPositivos.Count();
                    sentinel.Total = total.Sum(f => f.total);
                    sentinel.TotalCreditosNegativo = totalCreditosNegativo.Sum(f => f.total);
                    sentinel.TotalCreditosPositivos = totalCreditosPositivos.Sum(f => f.total);
                    if (sentinel.CantidadCreditosNegativos == 0)
                    {
                        sentinel.Indicador = "BUENO";
                    }
                    else if (sentinel.CantidadCreditosPositivos > sentinel.CantidadCreditosNegativos)
                    {
                        sentinel.Indicador = "REGULAR";
                    }
                    else
                    {
                        sentinel.Indicador = "MALO";
                    }
                    return await Task.FromResult(sentinel);
                }
            }
            catch (Exception e)
            {
                sentinel = null;
                Console.Write("Error" + e.ToString());
            }
            return sentinel;
        }       
        
        
        [HttpGet]
        [ActionName("IA")]
        [Route("Credito/ObtenerIndicadorIA")]
        public async Task<string> GetObtenerIndicadorIA(int clienteID)
        {
            Sentinel sentinel = new Sentinel();
            int INDICATOR = 0;
            try
            {

                var lista = creditoService.ObtenerHistorialSBS(clienteID, connString);

                var totalCreditosPositivos = from file in lista.Result
                                             where file.fecha_pago != null
                                             select new { total = file.Total };

                var totalCreditosNegativo = from file in lista.Result
                                            where file.fecha_pago == null
                                            select new { total = file.Total };

                var total = from file in lista.Result
                            select new { total = file.Total };

                sentinel.ClienteID = clienteID;
                sentinel.CantidadCreditos = total.Count();
                sentinel.CantidadCreditosNegativos = totalCreditosNegativo.Count();
                sentinel.CantidadCreditosPositivos = totalCreditosPositivos.Count();
                sentinel.Total = total.Sum(f => f.total);
                sentinel.TotalCreditosNegativo = totalCreditosNegativo.Sum(f => f.total);
                sentinel.TotalCreditosPositivos = totalCreditosPositivos.Sum(f => f.total);
                
                Random rnd = new Random();
                       
                if (sentinel.CantidadCreditosNegativos == 0)
                {
                    INDICATOR = rnd.Next(8, 10);
                }
                else if (sentinel.CantidadCreditosPositivos > sentinel.CantidadCreditosNegativos)
                {
                    INDICATOR = rnd.Next(5, 8);
                }
                else
                {
                    INDICATOR = rnd.Next(1, 4);
                }
                return await Task.FromResult(string.Concat("EL INDICADOR DEL IA ES: ", INDICATOR));
            }
            catch (Exception e)
            {
                Console.Write("Error" + e.ToString());
            }
            return await Task.FromResult("Sin respuesta.");
        }

    }
}