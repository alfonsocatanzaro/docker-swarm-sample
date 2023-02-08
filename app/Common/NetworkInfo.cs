using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class NetworkInfo
    {
        public string Name { get; set; } = "";
        public string Ip { get; set; } = "";
        public int PrefixLength { get; set; } = 0;


        public override string ToString() =>
            $"{Name}-{Ip}/{32 - PrefixLength}";
    }
}
