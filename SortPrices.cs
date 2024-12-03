using Npgsql;

namespace skibidihotels;

public class SortPrices
{
    public List<(string HotelName, string RoomNumber, int PricePerNight)> GetRoomsSortedByPriceDescending()
    {
        var rooms = new List<(string HotelName, string RoomNumber, int PricePerNight)>();
        
        DatabaseConnect _dbConnect = new DatabaseConnect();
        
        

        using (var connection = _dbConnect.GetConnection())
        {
            
            string query = "SELECT r.roomnumber, r.pricepernight, h.hotel_name FROM rooms r INNER JOIN hotels h ON r.hotels_id = h.hotels_id ORDER BY r.pricepernight DESC";

            using (var command = new NpgsqlCommand(query, connection))
            using (var reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    string roomNumber = reader.GetString(0);
                    int pricePerNight = reader.GetInt32(1);        
                    string hotelName = reader.GetString(2);        
                    rooms.Add((hotelName, roomNumber, pricePerNight));
                }
            }
        }

        return rooms;
    }

    public void PrintSortByPrice()
    {
        var rooms = GetRoomsSortedByPriceDescending();

        foreach (var roomsByPrice in rooms)
        {
            Console.WriteLine($"Hotel name : {roomsByPrice.HotelName}");
            Console.WriteLine($"RoomNumber : {roomsByPrice.RoomNumber}");
            Console.WriteLine($"Price per night (USD) : {roomsByPrice.PricePerNight}");
            Console.WriteLine(new string('-', 50));
        }
    }
}
