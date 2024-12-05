namespace skibidihotels;

public class Room
{
    public int RoomId { get; set; }
    public string RoomNumber { get; set; }
    public string RoomType { get; set; }
    public int Capacity { get; set; }
    public decimal PricePerNight { get; set; }
    public bool Balcony { get; set; }
    public string HotelName { get; set; }
}