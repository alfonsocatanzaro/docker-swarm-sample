using Common;
using Frontend.Models;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Frontend.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IConfiguration _configuration;
        public HomeController(ILogger<HomeController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        public async Task<IActionResult> Index()
        {
            var model = await buildModel();
            return View(model);
        }

        public async Task<IActionResult> Privacy()
        {
            var model = await buildModel();
            return View(model);
        }

        private async Task<BaseViewModel> buildModel()
        {
            BaseViewModel model = new();
            model.PageCreatedAt = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss.fff");
            model.Frontend = HostInfo.GetHostInfo(HttpContext);
            string dataServiceEndPoint = _configuration.GetValue<string>("DataServiceEndPoint");
            HttpClient c = new();

            var serviceData = await c.GetFromJsonAsync<ServiceData>($"{dataServiceEndPoint}/api/GetServiceData");
            if (serviceData != null ) { 
                model.Backend = serviceData.HostInfo;
                model.WeatherForecast = serviceData.WeatherForecast;
            }
            return model;
        }

      

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}