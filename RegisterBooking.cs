namespace skibidihotels;

public class RegisterBooking
{
    public void RegisterBookings()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();

        ClientData.DisplayClients();
        Console.WriteLine("Enter the clients id:");
        if (!int.TryParse(Console.ReadLine(), out int clientId) || clientId <= 0)
        {
            Console.WriteLine("Invalid client ID.");
            return;
        }

        Console.WriteLine("Enter room id:");
        string roomId = Console.ReadLine();

        Console.WriteLine("Enter email:");
        string email = Console.ReadLine();

        Console.WriteLine("Enter phone number:");
        string phoneNumber = Console.ReadLine();

        Console.WriteLine("Enter date of birth (yyyy-mm-dd):");
        string dob = Console.ReadLine();
    }
    
}