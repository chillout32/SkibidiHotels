namespace skibidihotels;
using Npgsql;


public class HotelLoader{
    
    public static List<loadInHotels> LoadInHotelsFromDatabase()
    {
        var hotels = new List<loadInHotels>();
        
        DatabaseConnect _dbConnect = new DatabaseConnect();
    
        try
        {
            using (var conn = _dbConnect.GetConnection())
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
    
                var sqlQuery =
                    "SELECT hotel_name, phonenumber, email, starsreview, gym, elevator, distancetobeach, distancetocentrum, " +
                    "pool, restaurant, childrensclub, eveningentertainment, city, country, zipcode, adress FROM hotels";
    
                using (var cmd = new NpgsqlCommand(sqlQuery, conn))
                using (var readRow = cmd.ExecuteReader())
                {
                    while (readRow.Read())
                    {
                        var hotel = new loadInHotels
                        {
                            hotel_name = readRow.GetString(0),
                            phonenumber = readRow.GetString(1),
                            email = readRow.GetString(2),
                            stars = readRow.GetInt32(3),
                            gym = readRow.GetBoolean(4),
                            elevator = readRow.GetBoolean(5),
                            distanceToBeach = readRow.GetDouble(6),
                            distanceToCentrum = readRow.GetDouble(7),
                            pool = readRow.GetBoolean(8),
                            restaurant = readRow.GetBoolean(9),
                            childrenClub = readRow.GetBoolean(10),
                            eveningEntertainment = readRow.GetBoolean(11),
                            city = readRow.GetString(12),
                            country = readRow.GetString(13),
                            zipcode = readRow.GetString(14),
                            adress = readRow.GetString(15)
                        };
                        hotels.Add(hotel);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    
        return hotels;
     }

    public void PrintHotels()
    {
        var hotels = LoadInHotelsFromDatabase();

        foreach (var hotel in hotels)
        {
            Console.WriteLine($"Hotel Name: {hotel.hotel_name}");
            Console.WriteLine($"Phone Number: {hotel.phonenumber}");
            Console.WriteLine($"Email: {hotel.email}");
            Console.WriteLine($"Stars: {hotel.stars}");
            Console.WriteLine($"Gym: {hotel.gym}");
            Console.WriteLine($"Elevator: {hotel.elevator}");
            Console.WriteLine($"Distance to Beach: {hotel.distanceToBeach}");
            Console.WriteLine($"Distance to Centrum: {hotel.distanceToCentrum}");
            Console.WriteLine($"Pool: {hotel.pool}");
            Console.WriteLine($"Restaurant: {hotel.restaurant}");
            Console.WriteLine($"Children's Club: {hotel.childrenClub}");
            Console.WriteLine($"Evening Entertainment: {hotel.eveningEntertainment}");
            Console.WriteLine($"City: {hotel.city}");
            Console.WriteLine($"Country: {hotel.country}");
            Console.WriteLine($"Zipcode: {hotel.zipcode}");
            Console.WriteLine($"Address: {hotel.adress}");
            Console.WriteLine(new string('-', 50)); // Separator
        }

    }

    public void PrintHotelsAndStars()
    {
        var hotels = LoadInHotelsFromDatabase();
        
        QuickAlgorithms.QuickSortStars(hotels, 0, hotels.Count - 1);

        foreach (var hotel in hotels)
        {
            Console.WriteLine($"Hotel Name: {hotel.hotel_name}");
            Console.WriteLine($"Stars: {hotel.stars}");
        }
    }
}