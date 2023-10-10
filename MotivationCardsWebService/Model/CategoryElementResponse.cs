using MotivationCardsWebService.Util;

namespace MotivationCardsWebService.Model;

using System.Data;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

public class CategoryElementResponse {
    public async Task<List<string>> getUniqueElementsOfCategory([FromBody]string categoryName) {
        var elements = new List<string>();

        var dbHandler = new DatabaseHandler();

        var dbTable = await dbHandler.executeSelectRaw($"SELECT DISTINCT {categoryName} FROM quotes");

        foreach(DataRow row in dbTable.Rows) {
            elements.Add(row.Field<string>($"{categoryName}"));
        }

        //for(int i = 0; i < 10; i++) {
        //    elements.Add("element " + (i + 1));
        //}

        return elements;
    }

    public async Task<List<string>> getQuotesForElementOfCategory(string category, string value) {
        var elements = new List<string>();

        var dbHandler = new DatabaseHandler();

        var dbTable = await dbHandler.executeSelectRaw($"SELECT * FROM quotes WHERE {category}='{value}'");

        foreach(DataRow row in dbTable.Rows) {
            elements.Add(row.Field<string>("quote"));
        }
        
        // TODO: SELECT * FROM quotes WHERE category=categoryValue
        // TODO: you need to send both category name and value, for example categoryName is gender, and category value is gender
        //for(int i = 0; i < 100; i++) {
        //    elements.Add("element " + (i + 1));
        //}

        return elements;
    }
}