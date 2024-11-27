namespace skibidihotels;
using Npgsql;

public class UpdateBooking
{
    private void UpdateBookingFunction(DatabaseConnect _dbConnect, int bookingID, DateTime newCheckIn, DateTime newCheckOut, int totalGuests, int roomID, 
        bool extraBed, bool allInclusive, bool halfPension)
    {
        

        try
        {
            using (var conn = _dbConnect.GetConnection())
            {
                                                            
                string query = @"UPDATE bookings 
                SET room_id = @RoomID,
                allinclusive = @AllInclusive,
                halfpension = @HalfPension,
                extrabed = @ExtraBed,
                checkin = @CheckIn,
                checkout = @CheckOut,
                peopleamount = @TotalGuests
                WHERE bookings_id = @BookingID";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("RoomID", roomID);
                    cmd.Parameters.AddWithValue("AllInclusive", allInclusive);
                    cmd.Parameters.AddWithValue("HalfPension", halfPension);
                    cmd.Parameters.AddWithValue("ExtraBed", extraBed);
                    cmd.Parameters.AddWithValue("CheckIn", newCheckIn);
                    cmd.Parameters.AddWithValue("CheckOut", newCheckOut);
                    cmd.Parameters.AddWithValue("TotalGuests", totalGuests);
                    cmd.Parameters.AddWithValue("BookingID", bookingID);
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }

    public void UpdateBookingQuestions()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();
        
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
        
        Console.WriteLine("What time do you want to check in (format: yyyy-MM-dd HH:mm)");
        DateTime newCheckIn = DateTime.Parse(Console.ReadLine());

        Console.WriteLine("What time do you want to check out (format: yyyy-MM-dd HH:mm):");
        DateTime newCheckOut = DateTime.Parse(Console.ReadLine());

         
        UpdateBookingFunction(_dbConnect,bookingID, newCheckIn, newCheckOut, totalGuests, roomID, extraBed, allInclusive, halfPension);
    }
}