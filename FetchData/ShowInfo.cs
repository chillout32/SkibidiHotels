using System.Data;
using Npgsql;

namespace skibidihotels;

public class ShowInfo
{
    public static void FetchBookingsAndClient()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();
        List<BookingInfo> bookings = new List<BookingInfo>();
    
        using (var connection = _dbConnect.GetConnection())
        {
            string query = "SELECT bookings_id, firstname, lastname FROM bookings INNER JOIN clients ON client_id = id";

            using (var cmd = new NpgsqlCommand(query, connection))
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var booking = new BookingInfo
                    {
                        BookingId = reader.GetInt32(0),
                        FirstName = reader.GetString(1),
                        LastName = reader.GetString(2)
                    };

                    bookings.Add(booking);
                }
            }
        }

     
        foreach (var booking in bookings)
        {
            Console.WriteLine($"Booking ID: {booking.BookingId}, First Name: {booking.FirstName}, Last Name: {booking.LastName}");
        }
    }
}
