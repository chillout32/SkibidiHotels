using System;
using Npgsql;

namespace skibidihotels;

public class MainMenu
{
    private RegisterCustomer _registerCustomer = new();
    private UpdateBooking _updateBooking  = new();
    private SortByReview _sortByReview = new();
    private SortByDstncBeach _sortByDstncBeach = new();
    private SortPrices _sortPrices = new();
    private CancelBookings _cancelBookings = new();
    public void start()
    {
        bool run = true;
        questions();
        while (run)
        {
            string answer = Console.ReadLine();

            switch (answer.Trim().ToLower())
            {
                case "1": 
                    _registerCustomer.RegisterCustomers(); 
                    return;
                case "2": 
                    _sortByReview.PrintHotelsAndStars();
                    return;
                case "3": 
                    _sortByDstncBeach.SortByDistance();
                    return;
                case "4":
                    _updateBooking.UpdateBookingQuestions(); 
                    return;
                case "5":
                    _sortPrices.PrintSortByPrice();
                    return;
                case "6":
                    _cancelBookings.CancelBooking();
                    return;
                case "x":
                    Environment.Exit(0); 
                    return;
            }
        }
    }

    private void questions()
    {
        Console.WriteLine("--- Welcome to SkibidiHotels ---" + $"\n");
        Console.WriteLine("1. Register customer");
        Console.WriteLine("2. List Hotels and sort by reviews/stars");
        Console.WriteLine("3. List Hotels and sort by distance to beach");
        Console.WriteLine("4. Change details in a booking");
        Console.WriteLine("5. List rooms and sort by price");
        Console.WriteLine("6. List bookings and cancel bookings");
        Console.WriteLine("x. Exit program");
    }
}