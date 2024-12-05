using Npgsql;

namespace skibidihotels;

public class FetchAvailableRooms
{
    public static void FetchRooms()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();
        List<RoomInfo> availableRooms = new List<RoomInfo>();

        try
        {
            
        
        using (var connection = _dbConnect.GetConnection())
        {
            string query = @"
            SELECT r.rooms_id, r.pricepernight, rt.roomtypename 
            FROM rooms r 
            LEFT JOIN bookings b ON r.rooms_id = b.room_id 
            JOIN roomtypes rt ON r.roomtype = rt.roomtypes_id 
            WHERE b.room_id IS NULL";

            using (var cmd = new NpgsqlCommand(query, connection))
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var room = new RoomInfo
                    {
                        RoomId = reader.GetInt32(0),
                        PricePerNight = reader.GetInt16(1),
                        RoomTypeName = reader.GetString(2),
                        
                    };

                    availableRooms.Add(room);
                }
            }
        }
        
        foreach (var room in availableRooms)
        {
            Console.WriteLine($"Room ID: {room.RoomId}, PricePerNight: {room.PricePerNight}, RoomType: {room.RoomTypeName}");
        }
    } catch (NpgsqlException ex)
        {
            Console.WriteLine("Database error: " + ex.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine("An unexpected error occurred: " + ex.Message);
        }

} }