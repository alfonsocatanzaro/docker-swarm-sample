namespace Common
{
    public class ServiceData
    {
        public HostInfo HostInfo { get; set; } = new HostInfo();
        public IEnumerable<WeatherForecast> WeatherForecast { get; set; } = Enumerable.Empty<WeatherForecast>();

    }
}