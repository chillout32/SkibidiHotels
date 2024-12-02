using System;
using Npgsql;

namespace skibidihotels
{
    public class RoomData
    {
        public static void DisplayRooms()
        {
            DatabaseConnect _dbConnect = new DatabaseConnect();
            try
            {
                using (var conn = _dbConnect.GetConnection())
                {
                    string query = @"SELECT 
                                        rooms.rooms_id, 
                                        rooms.roomnumber, 
                                        roomtypes.roomtypename, 
                                        rooms.capacity, 
                                        rooms.pricepernight, 
                                        rooms.isavailable, 
                                        rooms.balcony, 
                                        hotels.hotel_name 
                                     FROM rooms
                                     JOIN hotels ON rooms.hotels_id = hotels.hotels_id
                                     JOIN roomtypes ON rooms.roomtype = roomtypes.roomtypes_id";
                    
                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            Console.WriteLine("Rooms:");
                            Console.WriteLine("ID | Roomnumber | Roomtype | Capacity | Pricepernight | IsAvailable | Balcony | Hotel");
                            Console.WriteLine("-------------------------------------------------------------------------------------");

                            while (reader.Read())
                            {
                                int id = reader.GetInt32(0);
                                string roomnumber = reader.GetString(1);
                                string roomtype = reader.GetString(2);
                                int capacity = reader.GetInt32(3);
                                int pricepernight = reader.GetInt32(4);
                                bool isavailable = reader.GetBoolean(5);
                                bool balcony = reader.GetBoolean(6);
                                string hotel = reader.GetString(7);
                                

                                Console.WriteLine($"{id} | {roomnumber} | {roomtype} | {capacity} | {pricepernight} | {isavailable} | {balcony} | {hotel}");
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