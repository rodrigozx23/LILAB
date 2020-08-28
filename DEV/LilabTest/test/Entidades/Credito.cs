using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace test.Entidades
{
    public class Credito
    {
        public int CreditoID { get; set; }
        public int ClienteID { get; set; }
        public string NombreCliente { get; set; }
        public double Monto { get; set; }
        public bool EsSolicitado { get; set; }
        public string Estado { get; set; }
    }
}
