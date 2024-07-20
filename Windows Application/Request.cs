using System;
using System.Linq;
using System.Collections.Generic;
namespace Request
{
    public class Parametri
    {
        public double vlaznost_zemlje { get; set; }
        public double vlaznost_zraka { get; set; }
        public double nivo_co2 { get; set; }
        public double temperatura_zemlje { get; set; }
        public double temperatura_zraka { get; set; }
        public double jakost_svjetla { get; set; }
    }
    public class Upravljanje
    {
        public bool navodnjavanje { get; set; }
        public bool provjetravanje { get; set; }
        public bool grijanje { get; set; }
        public bool svjetiljke { get; set; }
        public bool vrata { get; set; }
    }
    public class Staklenici_fr_naziv
    {
        public string ime { get; set; }
        public Parametri parametri { get; set; }
        public Upravljanje upravljanje { get; set; }

    }
}