using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace test.Entidades
{
    public class Sentinel
    {
        public int ClienteID { get; set; }
        public double Total { get; set; }
        public int CantidadCreditos { get; set; }
        public string Indicador { get; set; }
        public int CantidadCreditosPositivos { get; set; }
        public double TotalCreditosPositivos { get; set; }
        public int CantidadCreditosNegativos { get; set; }
        public double TotalCreditosNegativo { get; set; }
    }
}
