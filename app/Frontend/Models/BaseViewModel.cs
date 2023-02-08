using Common;

namespace Frontend.Models
{
    public class BaseViewModel
    {
        public string PageCreatedAt { get; set; } = "";
        public HostInfo Frontend { get; set; } = new HostInfo();
        public HostInfo Backend { get;  set; } = new HostInfo();
        public IEnumerable<WeatherForecast> WeatherForecast { get;  set; } = Enumerable.Empty<WeatherForecast>();
    }

}
