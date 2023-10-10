namespace MotivationCardsWebService.Util;

using System.Data;
using Microsoft.VisualBasic;
using MySql.Data.MySqlClient;

public class DatabaseHandler {

    string connectionString;
    public DatabaseHandler() {
        var builder = WebApplication.CreateBuilder();
        builder.Services.AddControllersWithViews();

        this.connectionString = builder.Configuration.GetConnectionString("DefaultDbConnection");
    }


    public void executeInsertRaw(string insertQuery) {
        
        Console.WriteLine("Connection string is " + connectionString);

         // Create a MySqlConnection object using the connection string.
        MySqlConnection conn = new MySqlConnection(connectionString);

        // Open the connection.
        conn.Open();
        Console.WriteLine(insertQuery);

        // Create a MySqlCommand object to execute the SQL statement.
        MySqlCommand cmd = new MySqlCommand(insertQuery, conn);

        // Execute the SQL statement.
        cmd.ExecuteNonQuery();

        // Close the connection.
        conn.Close();
 
    }

    public async Task<DataTable> executeSelectRaw(string selectQuery) {
        using (var connection = new MySqlConnection(connectionString))
        {
            connection.Open();

            using (var command = new MySqlCommand(selectQuery, connection))
            {
                var dataAdapter = new MySqlDataAdapter(command);
                var dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                return dataTable;
            }
        }
    }
}