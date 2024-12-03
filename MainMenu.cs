using System;
using Npgsql;

namespace skibidihotels;

public class MainMenu
{
    private RegisterCustomer _registerCustomer;
    private UpdateBooking _updateBooking;
    private HotelLoader _hotelLoader;
    private SortByReview _sortByReview;
    private SortByDstncBeach _sortByDstncBeach;

    private SortPrices _sortPrices;

    public MainMenu()
    {
        _registerCustomer = new RegisterCustomer();
        _updateBooking = new UpdateBooking();
        _hotelLoader = new HotelLoader();

        _sortByReview = new SortByReview();
        _sortByDstncBeach = new SortByDstncBeach();

        _sortPrices = new SortPrices();

    }
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
                    _sortByDstncBeach.SortByDistance();
                    break;
                case "4":
                    _updateBooking.UpdateBookingQuestions(); 
                    break;
                case "5":
                    _sortPrices.PrintSortByPrice();
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
        Console.WriteLine("3. List Hotels and sort by distance to beach");
        Console.WriteLine("4. Change details in a booking");
        Console.WriteLine("5. List hotels and sort by price");
        Console.WriteLine("x. Exit program");
    }
}