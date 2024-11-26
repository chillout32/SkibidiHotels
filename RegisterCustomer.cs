using System;
using Npgsql;

namespace skibidihotels;

public class RegisterCustomer
{
    public void RegisterCustomer()
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
        
        InsertClientIntoDatabase(DatabaseConnect _dbConnect, firstName, lastName, email, phoneNumber, dob);
    }
    private void InsertClientIntoDatabase(string firstName, string lastName, string email, string phoneNumber, string dob)
    {

        try
        {
            using (var conn = _dbConnect.GetConnection())
            {
                conn.Open();

                string query = "INSERT INTO clients (firstname, lastname, email, phonenumber, dateofbirth) " +
                               "VALUES (@FirstName, @LastName, @Email, @PhoneNumber, @DateOfBirth)";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("FirstName", firstName);
                    cmd.Parameters.AddWithValue("LastName", lastName);
                    cmd.Parameters.AddWithValue("Email", email);
                    cmd.Parameters.AddWithValue("PhoneNumber", phoneNumber);
                    cmd.Parameters.AddWithValue("DateOfBirth", DateTime.Parse(dob));

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