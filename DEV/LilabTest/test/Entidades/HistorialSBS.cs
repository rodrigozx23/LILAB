using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace test.Entidades
{
    public class HistorialSBS
    {
        public int HistorialID { get; set; }
        public int ClienteID { get; set; }
        public string NombreCliente { get; set; }
        public double Total { get; set; }
        public DateTime fecha_credito { get; set; }
        public DateTime? fecha_pago { get; set; }
    }
}
