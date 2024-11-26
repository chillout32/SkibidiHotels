using System;
using Npgsql;

namespace skibidihotels;

public class HotelManager
{
    public void RegisterCustomer()
    {
        // Collect customer details
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

        // Insert into database
        InsertClientIntoDatabase(firstName, lastName, email, phoneNumber, dob);
    }

    // Method to insert customer into the database
    private void InsertClientIntoDatabase(string firstName, string lastName, string email, string phoneNumber, string dob)
    {
        string connectionString = "Host=localhost;Username=postgres;Password=Aqws12aqwsed;Database=postgres";

        try
        {
            using (var conn = new NpgsqlConnection(connectionString))
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

    public void UpdateBooking(int bookingID, DateTime newCheckIn, DateTime newCheckOut, int totalGuests, int roomID, 
        bool extraBed, bool allInclusive, bool halfPension)
    {
        
    }

    private void UpdateBookingQuestions()
    {
        Console.WriteLine("Whats your booking id");
        int bookingID = int.Parse(Console.ReadLine());
        
        Console.WriteLine("What time do you want to check in");
        DateTime newCheckIn = DateTime.Parse(Console.ReadLine());
        
        Console.WriteLine("What time do you want to check out");
        DateTime newCheckOut = DateTime.Parse(Console.ReadLine());
        
        Console.WriteLine("How many guests total will come");
        int totalGuests = int.Parse(Console.ReadLine());
        
        Console.WriteLine("Do you want to change room, please enter a new room ID (admin)");
        int roomID = int.Parse(Console.ReadLine());
        
        Console.WriteLine("Do you want a extra bed, (yes/no)?");
        string extraBedInput = Console.ReadLine().ToLower();
        bool extraBed = extraBedInput == "yes";
        
        Console.WriteLine("Do you want allinclusive , (yes/no)?");
        string allinclusiveInput = Console.ReadLine().ToLower();
        bool allInclusive = allinclusiveInput == "yes";
        
        Console.WriteLine("Do you want halfpension included, (yes/no)?");
        string halfpensionInput = Console.ReadLine().ToLower();
        bool halfPension = halfpensionInput == "yes";
    }
}