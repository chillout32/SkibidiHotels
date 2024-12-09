using System;
using Npgsql;

namespace skibidihotels;

public class MainMenu
{
    private RegisterCustomer _registerCustomer = new();
    private UpdateBooking _updateBooking = new();
    private SortByReview _sortByReview = new();
    private CancelBookings _cancelBookings = new();
    private SortPrices _sortPrices = new();
    private RegisterBooking _registerBooking = new();
    private FilterDistance _filterDistance = new();
    
    public void start()
    {
        bool run = true;
        
        while (run)
        {
            questions();
            string answer = Console.ReadLine();

            switch (answer.Trim().ToLower())
            {
                case "1": 
                    _registerCustomer.RegisterCustomers(); 
                    break;
                case "2": 
                    _sortByReview.PrintHotelsAndStars();
                    break;
                case "3":
                    _updateBooking.UpdateBookings(); 
                    break;
                case "4":
                    _sortPrices.PrintSortByPrice();
                    break;
                case "5":
                    _cancelBookings.CancelBooking();
                    break;
                case "6":
                    _registerBooking.RegisterBookings();
                    break;
                case "7":
                    _filterDistance.FilterDistanceToBeach();
                    break;
                case "8":
                    _filterDistance.FilterDistanceToCentrum();
                    break;
                case "x":
                    run = false;
                    break;
            }
        }
    }

    private void questions()
    {
        Console.WriteLine("--- Welcome to SkibidiHotels ---" + $"\n");
        Console.WriteLine("1. Register customer");
        Console.WriteLine("2. List Hotels and sort by reviews/stars");
        Console.WriteLine("3. Change details in a booking");
        Console.WriteLine("4. List hotels and sort by price");
        Console.WriteLine("5. Cancel a registered booking");
        Console.WriteLine("6. Register booking");
        Console.WriteLine("7. Filter distance to beach");
        Console.WriteLine("8. Filter distance to centrum");
        Console.WriteLine("x. Exit program");
    }
}