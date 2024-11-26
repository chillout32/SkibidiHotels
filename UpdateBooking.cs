namespace skibidihotels;
using Npgsql;

public class UpdateBooking
{
    private void UpdateBookingFunction(int bookingID, DateTime newCheckIn, DateTime newCheckOut, int totalGuests, int roomID, 
        bool extraBed, bool allInclusive, bool halfPension)
    {
        string connectionString = "Host=localhost;Username=postgres;Password=Aqws12aqwsed;Database=postgres";

        try
        {
            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                
                
            }
        }
    }

    public void UpdateBookingQuestions()
    {
        Console.WriteLine("Whats your booking id");
        int bookingID = int.Parse(Console.ReadLine());
        
        Console.WriteLine("How many guests total will come");
        int totalGuests = int.Parse(Console.ReadLine());
        
        Console.WriteLine("Do you want to change room, please enter a new room ID (admin)");
        int roomID = int.Parse(Console.ReadLine());
        
        Console.WriteLine("Do you want a extra bed, (yes/no)?");
        string extraBedInput = Console.ReadLine().ToLower();
        bool extraBed = extraBedInput == "yes";
        
        Console.WriteLine("Do you want allinclusive , (yes/no)?");
        string allinclusiveInput = Console.ReadLine().ToLower();
        bool allInclusive = allinclusiveInput == "yes";
        
        Console.WriteLine("Do you want halfpension included, (yes/no)?");
        string halfpensionInput = Console.ReadLine().ToLower();
        bool halfPension = halfpensionInput == "yes";
        
        Console.WriteLine("What time do you want to check in");
        DateTime newCheckIn = DateTime.Parse(Console.ReadLine());

        Console.WriteLine("What time do you want to check out (format: yyyy-MM-dd HH:mm):");
        DateTime newCheckOut = DateTime.Parse(Console.ReadLine());

        
        UpdateBookingFunction(bookingID, newCheckIn, newCheckOut, totalGuests, roomID, extraBed, allInclusive, halfPension);
    }
}