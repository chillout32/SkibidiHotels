using System;
using Npgsql;

namespace skibidihotels
{
    public class ClientData
    {
        public static void DisplayClients()
        {
            DatabaseConnect _dbConnect = new DatabaseConnect();
            try
            {
                using (var conn = _dbConnect.GetConnection())
                {
                    string query = "SELECT id, firstname, lastname, email FROM clients";
                    
                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            Console.WriteLine("Clients:");
                            Console.WriteLine("ID | First Name | Last Name | Email");
                            Console.WriteLine("-----------------------------------");

                            while (reader.Read())
                            {
                                int id = reader.GetInt32(0);
                                string firstName = reader.GetString(1);
                                string lastName = reader.GetString(2);
                                string email = reader.GetString(3);

                                Console.WriteLine($"{id} | {firstName} | {lastName} | {email}");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}