
namespace MotivationCardsWebService.Model;

//using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;

public class QuoteModel{
    public string quote { get; set; }
    public string author { get; set; }
    public string gender { get; set; }
    public string category { get; set; }

    public void createQuote(string q, string a, string g, string c) {
        var builder = WebApplication.CreateBuilder();
        builder.Services.AddControllersWithViews();

        var connectionString = builder.Configuration.GetConnectionString("DefaultDbConnection");
        Console.WriteLine("Connection string is " + connectionString);

         // Create a MySqlConnection object using the connection string.
        MySqlConnection conn = new MySqlConnection(connectionString);

        // Open the connection.
        conn.Open();
        Console.WriteLine("INSERT INTO quotes (quote, author, gender, category) VALUES ('" + q + "', '" + a + "', '" + g + "', '" + c + "')");

        // Create a MySqlCommand object to execute the SQL statement.
        MySqlCommand cmd = new MySqlCommand("INSERT INTO quotes (quote, author, gender, category) VALUES ('" + q + "', '" + a + "', '" + g + "', '" + c + "')", conn);

        // Execute the SQL statement.
        cmd.ExecuteNonQuery();

        // Close the connection.
        conn.Close();
 
    }
}