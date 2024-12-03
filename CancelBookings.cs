using System;
using Npgsql;

namespace skibidihotels;

public class CancelBookings
{
    public void CancelBooking()
    {
        DatabaseConnect _dbconnect = new DatabaseConnect();        
        //Sub Menu Cancel Booking.
        Console.WriteLine("Submit your booking ID:");
        string input = Console.ReadLine();
        //DELETE BOOKING BY ID

        if (int.TryParse(input, out int bookingId))
        {
                try
                {
                    using (var conn = _dbconnect.GetConnection())
                    {
                        string deleteQuery = "DELETE FROM bookings WHERE bookings_id = @bookings_id";

                        using (var cmd = new NpgsqlCommand(deleteQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("bookings_id", bookingId); // Use the user-provided booking ID

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                Console.WriteLine($"Successfully deleted booking with ID {bookingId}.");
                            }
                            else
                            {
                                Console.WriteLine($"No booking found with ID {bookingId}. No rows were deleted.");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
        }
        else
        {
            Console.WriteLine("Invalid input. Please enter a valid booking ID.");
        }
    }
}