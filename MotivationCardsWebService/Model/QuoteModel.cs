
namespace MotivationCardsWebService.Model;

using MySql.Data.MySqlClient;
using MotivationCardsWebService.Util;
using System.Data;
using System.ComponentModel;

public class QuoteModel {
    public string quote { get; set; }
    public string author { get; set; }
    public string gender { get; set; }
    public string category { get; set; }

    public void createQuote(string q, string a, string g, string c) {

        var dbHandler = new DatabaseHandler();
        Console.WriteLine("INSERT INTO quotes (quote, author, gender, category) VALUES ('" + q + "', '" + a + "', '" + g + "', '" + c + "')");
        dbHandler.executeInsertRaw("INSERT INTO quotes (quote, author, gender, category) VALUES ('" + q + "', '" + a + "', '" + g + "', '" + c + "')");
    }

    public async void selectFromQuotes() {
        var dbHandler = new DatabaseHandler();
        var retVal = await dbHandler.executeSelectRaw("select * from quotes");

        foreach(DataRow row in retVal.Rows) {
           Console.WriteLine(row.Field<string>("quote") + " - " + row.Field<string>("author"));
        }
    }
}