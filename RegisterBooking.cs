using System;
using Npgsql;

namespace skibidihotels;

public class RegisterBooking
{
    public void RegisterBookings()
    {
        DatabaseConnect _dbConnect = new DatabaseConnect();

        Console.WriteLine("Enter the check-in time (yyyy-mm-dd hh:mm):");
        DateTime checkinTime = DateTime.Parse(Console.ReadLine());

        DateTime checkoutTime;
        while (true)
        {
            Console.WriteLine("Enter the check-out date (yyyy-mm-dd hh:mm):");
            checkoutTime = DateTime.Parse(Console.ReadLine());

            if (checkoutTime <= checkinTime)
            {
                Console.WriteLine("Error: The checkout time must be later than the check-in time. Please enter again.");
            }
            else
            {
                break;
            }
        }

        List<Room> availableRooms = GetAvailableRooms(_dbConnect, checkinTime, checkoutTime); // Change to List<Room>

        if (availableRooms.Count == 0)
        {
            Console.WriteLine("No rooms available for the selected dates.");
            return;
        }

        Console.WriteLine("Available rooms:");
        foreach (var room in availableRooms)
        {
            Console.WriteLine($"Room ID: {room.RoomId}, Room Number: {room.RoomNumber}, Type: {room.RoomType}, Capacity: {room.Capacity}, Price per night: {room.PricePerNight}, Balcony: {room.Balcony}, Hotel: {room.HotelName}");
        }

        Console.WriteLine("Enter room id:");
        int roomId = int.Parse(Console.ReadLine());

        ClientData.DisplayClients();
        Console.WriteLine("Enter the client's id:");
        int clientId = int.Parse(Console.ReadLine());

        bool allInclusive = BooleanConverter("Does the client have all-inclusive? (yes/no):");
        bool halfPension = BooleanConverter("Does the client have half-pension? (yes/no):");
        bool extraBed = BooleanConverter("Does the client want an extra bed? (yes/no):");

        Console.WriteLine("Enter the total price for the booking:");
        int totalPrice = int.Parse(Console.ReadLine());

        Console.WriteLine("Enter the total amount of people for the booking:");
        string totalPeopleAmount = Console.ReadLine();

        InsertBookingIntoDatabase(_dbConnect, clientId, roomId, allInclusive, halfPension, extraBed, totalPrice, checkinTime, checkoutTime, totalPeopleAmount);
    }

    private bool BooleanConverter(string prompt)
    {
        Console.WriteLine(prompt);
        while (true)
        {
            string input = Console.ReadLine()?.Trim().ToLower();
            if (input == "yes") return true;
            if (input == "no") return false;
            Console.WriteLine("Invalid Input");
        }
    }

    private List<Room> GetAvailableRooms(DatabaseConnect _dbConnect, DateTime checkinTime, DateTime checkoutTime)
    {
        List<Room> availableRooms = new List<Room>();

        try
        {
            using (var conn = _dbConnect.GetConnection())
            {
                string query = @"
                    SELECT 
                        rooms.rooms_id, 
                        rooms.roomnumber, 
                        roomtypes.roomtypename, 
                        rooms.capacity, 
                        rooms.pricepernight, 
                        rooms.balcony, 
                        hotels.hotel_name 
                    FROM rooms
                    JOIN hotels ON rooms.hotels_id = hotels.hotels_id
                    JOIN roomtypes ON rooms.roomtype = roomtypes.roomtypes_id
                    WHERE NOT EXISTS (
                        SELECT 1
                        FROM bookings
                        WHERE bookings.room_id = rooms.rooms_id
                        AND (
                            (bookings.checkin < @checkoutTime AND bookings.checkout > @checkinTime)
                            OR
                            (bookings.checkin >= @checkinTime AND bookings.checkin < @checkoutTime)
                            OR
                            (bookings.checkout > @checkinTime AND bookings.checkout <= @checkoutTime)
                        )
                    );";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@checkinTime", checkinTime);
                    cmd.Parameters.AddWithValue("@checkoutTime", checkoutTime);

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            availableRooms.Add(new Room
                            {
                                RoomId = reader.GetInt32(0),
                                RoomNumber = reader.GetString(1),
                                RoomType = reader.GetString(2),
                                Capacity = reader.GetInt32(3),
                                PricePerNight = reader.GetDecimal(4),
                                Balcony = reader.GetBoolean(5),
                                HotelName = reader.GetString(6)
                            });
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error fetching available rooms: {ex.Message}");
        }

        return availableRooms;
    }

    private void InsertBookingIntoDatabase(DatabaseConnect _dbConnect, int clientId, int roomId, bool allInclusive, bool halfPension, bool extraBed, int totalPrice, DateTime checkinTime, DateTime checkoutTime, string totalPeopleAmount)
    {
        try
        {
            using (var conn = _dbConnect.GetConnection())
            {
                string query = @"
                INSERT INTO Bookings 
                    (client_id, room_id, allinclusive, halfpension, extrabed, totalprice, checkin, checkout, peopleamount)
                VALUES 
                    ($1, $2, $3, $4, $5, $6, $7, $8, $9)";

                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue(clientId);
                    cmd.Parameters.AddWithValue(roomId);
                    cmd.Parameters.AddWithValue(allInclusive);
                    cmd.Parameters.AddWithValue(halfPension);
                    cmd.Parameters.AddWithValue(extraBed);
                    cmd.Parameters.AddWithValue(totalPrice);
                    cmd.Parameters.AddWithValue(checkinTime);
                    cmd.Parameters.AddWithValue(checkoutTime);
                    cmd.Parameters.AddWithValue(totalPeopleAmount);

                    cmd.ExecuteNonQuery();
                }

                Console.WriteLine("Booking registered successfully!");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}
