namespace skibidihotels;

public class SortByDstncBeach
{
    
    public void SortByDistance()
    {
        var hotels = HotelLoader.LoadInHotelsFromDatabase();

        if (hotels == null || hotels.Count == 0)
        {
            Console.WriteLine("No hotels to sort (get back to work slave).");
            return;
        }

        var sortedHotels = hotels.OrderBy(h => h.distanceToBeach).ToList();
        
        Console.WriteLine($"Sorting {hotels.Count} hotels...");

        foreach (var hotel in hotels)
        {
            Console.WriteLine($"Hotel Name: {hotel.hotel_name}");
            Console.WriteLine($"Distance to beach: {hotel.distanceToBeach}");
        }
    }
}