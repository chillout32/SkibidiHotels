using System;
using Npgsql;

namespace skibidihotels;

public class MainMenu
{
    private RegisterCustomer _registerCustomer;
    private UpdateBooking _updateBooking;
    private HotelLoader _hotelLoader;

    public MainMenu()
    {
        _registerCustomer = new RegisterCustomer();
        _updateBooking = new UpdateBooking();
        _hotelLoader = new HotelLoader();
    }
    public void start()
    {
        bool run = true;
        questions();
        while (run)
        {
            String answer = Console.ReadLine();

            switch (answer.Trim().ToLower())
            {
                case "1": 
                    _registerCustomer.RegisterCustomers(); 
                    break;
                case "2": break;
                case "3": _updateBooking.UpdateBookingQuestions(); 
                    break;
                case "4": break;
                case "5": break;
                case "x":
                    Environment.Exit(0); 
                    break;
            }
        }
    }

    private void questions()
    {
        Console.WriteLine("--- Welcome to SkibidiHotels ---" + $"\n");
        Console.WriteLine("1. Register customer");
        Console.WriteLine("2. Search available rooms with details");
        Console.WriteLine("3. Change details in a booking");
        Console.WriteLine("4. Cancel booking");
        Console.WriteLine("5. Register booking");
        Console.WriteLine("x. Exit program");
    }
}