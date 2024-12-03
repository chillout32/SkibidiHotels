using System;
using System.Runtime.InteropServices.JavaScript;
using Npgsql;

namespace skibidihotels
{
    public class BookingData
    {
        public static void DisplayBookings()
        {
            DatabaseConnect _dbConnect = new DatabaseConnect();
            try
            {
                using (var conn = _dbConnect.GetConnection())
                {
                    string query = @"SELECT 
                                        bookings.bookings_id, 
                                        bookings.client_id, 
                                        bookings.room_id,
                                        bookings.checkin,
                                        bookings.checkout,
                                        clients.firstname,
                                        clients.lastname
                                     FROM bookings
                                     JOIN clients ON bookings.client_id = clients.id";
                    
                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            Console.WriteLine("Bookings:");
                            Console.WriteLine("ID | Client ID | room ID | Check in date | Check out date | Firstname | Lastname");
                            Console.WriteLine("-------------------------------------------------------------------------------------");

                            while (reader.Read())
                            {
                                int booking_id = reader.GetInt32(0);
                                int client_id = reader.GetInt32(1);
                                int room_id = reader.GetInt32(2);
                                DateTime checkin = reader.GetDateTime(3);
                                DateTime checkout = reader.GetDateTime(4);
                                string firstname = reader.GetString(5);
                                string lastname = reader.GetString(6);
                                

                                Console.WriteLine($"{booking_id} | {client_id} | {room_id} | {checkin} | {checkout} | {firstname} | {lastname}");
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