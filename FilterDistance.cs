namespace skibidihotels;

public class FilterDistance
{
    public void FilterDistanceToBeach()
    {
        var hotels = HotelLoader.LoadInHotelsFromDatabase();

        Console.WriteLine("How long is the max of the distance from the beach?");
        string answer = Console.ReadLine();
        
            if (double.TryParse(answer, out double MaxDistance))
            {
                foreach (var hotel in hotels)
                {
                    if (hotel.distanceToBeach <= MaxDistance)
                    {
                        Console.WriteLine($"Hotel: {hotel.hotel_name}, Distance to Beach: {hotel.distanceToBeach}");
                    }
                }
            }
            else
            {
                Console.WriteLine("Please enter a valid number");
            }
    }
}