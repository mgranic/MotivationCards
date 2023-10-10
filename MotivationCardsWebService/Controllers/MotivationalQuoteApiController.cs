using System.Drawing.Printing;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using MotivationCardsWebService.Model;

namespace MotivationCardsWebService.Controllers;

[ApiController]
[Route("[controller]")]
public class MotivationalQuoteApiController : ControllerBase
{
    //[HttpPost("GetMotivationalQuotePost")]
    //public IActionResult GetMotivationalQuotePost([FromBody] UserModel usr)
    //{
    //    Random random = new Random();
    //    var retVal = usr.gender + " - " + usr.age + " - " + random.Next(1, 200);
    //    Console.WriteLine(retVal);
    //    return Ok("response is " + retVal);
    //}

    [HttpPost("GetMotivationalQuotePost")]
    [Produces("application/json")]
    public async Task<IActionResult> GetMotivationalQuotePost([FromBody] UserModel usr)
    {
        Random random = new Random();
        var retVal = usr.gender + " - " + usr.age + " - " + random.Next(1, 200);
        Console.WriteLine(retVal);

        QuoteModel qm = new QuoteModel();
        qm.selectFromQuotes();

        return Ok(retVal);
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

    [HttpPost("GetUniqueCategoryElements")]
    [Produces("application/json")]
    public async Task<IActionResult> GetUniqueCategoryElements([FromBody]CategoryElementRequestModel receivedCategory)
    {
        var elementsResponse = new CategoryElementResponse();
        // Perform whatever processing you need to do on the string parameter.
        Console.WriteLine(receivedCategory.category);

        // Create a JSON object to return to the client.
        var jsonObject = new
        {
            category = receivedCategory.category,
            listOfElements = await elementsResponse.getUniqueElementsOfCategory(receivedCategory.category)
        };

        Console.WriteLine("Category = *** " + receivedCategory.category);

        // Return the JSON object from the method.
        return Ok(jsonObject);
    }

    [HttpPost("GetQuotesForCategoryElement")]
    [Produces("application/json")]
    public async Task<IActionResult> GetQuotesForCategoryElement([FromBody]QuoteListRequest categoryElement)
    {
        var elementsResponse = new CategoryElementResponse();
        // Perform whatever processing you need to do on the string parameter.
        Console.WriteLine(categoryElement.category);

        // Create a JSON object to return to the client.
        var jsonObject = new
        {
            category = categoryElement.category,
            listOfElements = await elementsResponse.getQuotesForElementOfCategory(categoryElement.category, categoryElement.value)
        };

        Console.WriteLine("Element = *** " + categoryElement.category);

        // Return the JSON object from the method.
        return Ok(jsonObject);
    }

}