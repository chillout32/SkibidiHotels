namespace skibidihotels;

public class SortByReview
{
    public void PrintHotelsAndStars()
    {
        var hotels = HotelLoader.LoadInHotelsFromDatabase();

        if (hotels == null || hotels.Count == 0)
        {
            Console.WriteLine("No hotels to sort.");
            return;
        }

        Console.WriteLine($"Sorting {hotels.Count} hotels...");

        QuickAlgorithms.QuickSortStars(hotels, 0, hotels.Count - 1);

        foreach (var hotel in hotels)
        {
            Console.WriteLine($"Hotel Name: {hotel.hotel_name}");
            Console.WriteLine($"Stars: {hotel.stars}");
        }
    }
}