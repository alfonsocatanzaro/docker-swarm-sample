using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Reflection;

namespace Common
{
    public class HostInfo
    {
        public string HostName { get; set; } = "";
        public string RemoteAddress { get; set; } = "";

        public List<NetworkInfo> Adapters { get; set; } = new List<NetworkInfo>();
        public static HostInfo GetHostInfo(HttpContext httpContext)
        {
            var adapters = new List<NetworkInfo>();
            foreach (var n in NetworkInterface.GetAllNetworkInterfaces())
            {
                var info = new NetworkInfo();
                info.Name= n.Name;
                var a = n.GetIPProperties();
                info.Ip = a.UnicastAddresses?.FirstOrDefault()?.Address?.ToString() ?? "";
                info.PrefixLength = a.UnicastAddresses?.FirstOrDefault()?.PrefixLength ?? 0;
                if (!string.IsNullOrEmpty(info.Ip) && info.Ip != "127.0.0.1")
                    adapters.Add(info);
            }

            return new HostInfo()
            {
                HostName = Environment.MachineName,
                Adapters = adapters.OrderBy(a => a.Name).ToList(),
                RemoteAddress = httpContext.Connection.RemoteIpAddress.ToString()
            };
        }
    }
}
