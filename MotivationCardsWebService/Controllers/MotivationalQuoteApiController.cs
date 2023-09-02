using Microsoft.AspNetCore.Mvc;

namespace MotivationCardsWebService.Controllers;

[ApiController]
[Route("[controller]")]
public class MotivationalQuoteApiController : ControllerBase
{

   // https://localhost:7081/MotivationalQuoteApi?name=GetWeatherForecast
   // [HttpGet(Name = "GetWeatherForecast")]
   //localhost:5079/MotivationalQuoteApi/GetMotivationalQuote/radiiiii
   [HttpGet("GetMotivationalQuote/{param}")]
    public String GetMotivationalQuote(String param)
    {
        Console.WriteLine(param);
       //return "{\"type\": \"json object\"}";
       return param;
    }

    [HttpPost("GetMotivationalQuotePost")]
    public String GetMotivationalQuotePost([FromBody] String param)
    {
        Console.WriteLine(param);
        return "response is " + param;
    }
}
