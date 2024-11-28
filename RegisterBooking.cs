using System;
using Npgsql;

namespace skibidihotels;

public class RegisterBooking
{
    public void RegisterBookings()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();

        ClientData.DisplayClients();
        Console.WriteLine("Enter the clients id:");
        int clientId = int.Parse(Console.ReadLine());
        
        RoomData.DisplayRooms();
        Console.WriteLine("Enter room id:");
        int roomId = int.Parse(Console.ReadLine());

        Console.WriteLine("Does the client have allinclusive?:");
        bool allinclusive = Console.ReadLine();

        Console.WriteLine("Does the client have half pension?:");
        bool halfpension = Console.ReadLine();

        Console.WriteLine("Does the client want an extra bed?:");
        bool extrabed = Console.ReadLine();
        
        Console.WriteLine("Enter the totalprice for the booking:");
        int totalprice = int.Parse(Console.ReadLine());
        
        Console.WriteLine("Enter the check-in time:");
        string checkintime = Console.ReadLine();
        
        Console.WriteLine("Enter the check-out time:");
        string checkouttime = Console.ReadLine();
        
        Console.WriteLine("Enter the total amount of people for the booking:");
        string totalamount = Console.ReadLine();
    }
    
}