using System;
using Npgsql;

namespace skibidihotels;

public class RegisterBooking
{
    public void RegisterBookings()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();

        ClientData.DisplayClients();
        Console.WriteLine("Enter the clients id:");
        int clientId = int.Parse(Console.ReadLine());
        
        RoomData.DisplayRooms();
        Console.WriteLine("Enter room id:");
        int roomId = int.Parse(Console.ReadLine());
        
        bool allInclusive = BooleanConverter("Does the client have all-inclusive? (yes/no):");
        
        bool halfPension = BooleanConverter("Does the client have half-pension? (yes/no):");
        
        bool extraBed = BooleanConverter("Does the client want an extra bed? (yes/no):");
        
        Console.WriteLine("Enter the totalprice for the booking:");
        int totalPrice = int.Parse(Console.ReadLine());
        
        Console.WriteLine("Enter the check-in time yyyy-mm-dd hh:mm:");
        DateTime checkinTime = DateTime.Parse(Console.ReadLine());
        
        Console.WriteLine("Enter the check-out time yyyy-mm-dd hh:mm:");
        DateTime checkoutTime = DateTime.Parse(Console.ReadLine());
        
        Console.WriteLine("Enter the total amount of people for the booking:");
        string totalpeopleAmount = Console.ReadLine();
        
        InsertBookingIntoDatabase(_dbConnect, clientId, roomId, allInclusive, halfPension, extraBed, totalPrice, checkinTime, checkoutTime, totalpeopleAmount);
    }

    private bool BooleanConverter(string prompt)
    {
        Console.WriteLine(prompt);
        while (true)
        {
            string input = Console.ReadLine()?.Trim().ToLower();
            if (input == "yes") return true;
            if (input == "no") return false;
            Console.WriteLine("Invalid Input");
        }
    }
    
    private void InsertBookingIntoDatabase(DatabaseConnect _dbConnect, int clientId, int roomId, bool allInclusive, bool halfPension, bool extraBed, int totalPrice, DateTime checkinTime, DateTime checkoutTime, string totalpeopleAmount)
    {

        try
        {
            using (var conn = _dbConnect.GetConnection())
            {

                string query = "INSERT INTO Bookings (client_id, room_id, allinclusive, halfpension, extrabed, totalprice, checkin, checkout, peopleamount)" +
                               "VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue(clientId);
                    cmd.Parameters.AddWithValue(roomId);
                    cmd.Parameters.AddWithValue(allInclusive);
                    cmd.Parameters.AddWithValue(halfPension);
                    cmd.Parameters.AddWithValue(extraBed);
                    cmd.Parameters.AddWithValue(totalPrice);
                    cmd.Parameters.AddWithValue(checkinTime);
                    cmd.Parameters.AddWithValue(checkoutTime);
                    cmd.Parameters.AddWithValue(totalpeopleAmount);
                    
                    cmd.ExecuteNonQuery();
                }

                Console.WriteLine("Booking registered successfully!");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}