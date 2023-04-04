namespace PenaltyCalculation.Models
{
    public class Holiday
    {
        public int HolidayId { get; set; }
        public string? HolidayName { get; set; }
        public DateTime Date { get; set; }
        public int CountryId { get; set; }
        public Country? Country { get; set; }
    }
}
