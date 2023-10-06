using Microsoft.AspNetCore.Mvc;
using MotivationCardsWebService.Model;

namespace MotivationCardsWebService.Controllers;

[ApiController]
[Route("[controller]")]
public class MotivationalQuoteApiController : ControllerBase
{

   // https://localhost:7081/MotivationalQuoteApi?name=GetWeatherForecast
   // [HttpGet(Name = "GetWeatherForecast")]
   //https://0.0.0.0:5079/MotivationalQuoteApi/GetMotivationalQuote/radiiiiixxx
   //https:/localhost:5079/MotivationalQuoteApi/GetMotivationalQuote/radiiiiixxx
   [HttpGet("GetMotivationalQuote/{param}")]
    public IActionResult GetMotivationalQuote(String param)
    {
        Random random = new Random();
        String returnValue = param + "-" + random.Next(1, 101);
        Console.WriteLine(returnValue);
       //return "{\"type\": \"json object\"}";
       return Ok(returnValue);
    }

    [HttpPost("GetMotivationalQuotePost")]
    public IActionResult GetMotivationalQuotePost([FromBody] String param)
    {
        Console.WriteLine(param);
        return Ok("response is " + param);
    }


    [HttpPost("CreateMotivationalQuotePost")]
    [Produces("application/json")]
    public IActionResult CreateMotivationalQuotePost([FromBody]QuoteModel quote)
    {
        Console.WriteLine("Quote received is: " + quote.quote);
        Console.WriteLine("Author received is: " + quote.author);
        Console.WriteLine("Gender received is: " + quote.gender);
        Console.WriteLine("Motivations received is: " + quote.category);

        QuoteModel qm = new QuoteModel();
        qm.createQuote(quote.quote, quote.author, quote.gender, quote.category);

        return Ok(quote.quote);
    }

    [HttpPost("GelUniqueCategoryElements")]
    public IActionResult GelUniqueCategoryElements(string receivedCategory)
    {
        // Perform whatever processing you need to do on the string parameter.

        // Create a JSON object to return to the client.
        var jsonObject = new
        {
            category = receivedCategory,
            categoryElements = "JSON string of category elements"
        };

        Console.WriteLine("Category = *** " + receivedCategory);

        // Return the JSON object from the method.
        return Ok(jsonObject);
    }

}