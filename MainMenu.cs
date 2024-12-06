﻿using System;
using Npgsql;

namespace skibidihotels;

public class MainMenu
{
    private RegisterCustomer _registerCustomer = new();
    private UpdateBooking _updateBooking = new();
    private SortByReview _sortByReview = new();
    private SortByDstncBeach _sortByDstncBeach = new ();
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
                    _sortByDstncBeach.SortByDistance();
                    break;
                case "4":
                    _updateBooking.UpdateBookings(); 
                    break;
                case "5":
                    _sortPrices.PrintSortByPrice();
                    break;
                case "6":
                    _cancelBookings.CancelBooking();
                    break;
                case "7":
                    _registerBooking.RegisterBookings();
                    break;
                case "8":
                    _filterDistance.FilterDistanceToBeach();
                    break;
                case "9":
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
        Console.WriteLine("3. List Hotels and sort by distance to beach");
        Console.WriteLine("4. Change details in a booking");
        Console.WriteLine("5. List hotels and sort by price");
        Console.WriteLine("6. Cancel a registered booking");
        Console.WriteLine("7. Register booking");
        Console.WriteLine("8. Filter distance to beach");
        Console.WriteLine("9. Filter distance to centrum");
        Console.WriteLine("x. Exit program");
    }
}