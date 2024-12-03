using System;
using Npgsql;

namespace skibidihotels;

public class RegisterCustomer
{
    public void RegisterCustomers()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();
        // Questions to get details about customer
        Console.WriteLine("Enter first name:");
        string firstName = Console.ReadLine();

        Console.WriteLine("Enter last name:");
        string lastName = Console.ReadLine();

        Console.WriteLine("Enter email:");
        string email = Console.ReadLine();

        Console.WriteLine("Enter phone number:");
        string phoneNumber = Console.ReadLine();

        Console.WriteLine("Enter date of birth (yyyy-mm-dd):");
        string dob = Console.ReadLine();
        
        InsertClientIntoDatabase(_dbConnect, firstName, lastName, email, phoneNumber, dob);
    }
    private void InsertClientIntoDatabase(DatabaseConnect _dbConnect, string? firstName, string lastName, string email, string phoneNumber, string dob)
    {

        try
        {
            using (var conn = _dbConnect.GetConnection())
            {

                string query = "INSERT INTO clients (firstname, lastname, email, phonenumber, dateofbirth) " +
                               "VALUES ($1, $2, $3, $4, $5)";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue(lastName);
                    cmd.Parameters.AddWithValue(firstName);
                    cmd.Parameters.AddWithValue(email);
                    cmd.Parameters.AddWithValue(phoneNumber);
                    cmd.Parameters.AddWithValue(DateTime.Parse(dob));
                    cmd.ExecuteNonQuery();
                }

                Console.WriteLine("Customer registered successfully!");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}