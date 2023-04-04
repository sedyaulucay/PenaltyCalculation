namespace PenaltyCalculation.Models
{
    public class Country
    {
        public int CountryId { get; set; }
        public string? Name { get; set; }
        public string? CurrencyCode { get; set; }
        public decimal PenaltyAmount { get; set; }
        public int PenaltyDayCount { get; set; }
        public string? OffDay1 { get; set; }
        public string? OffDay2 { get; set; }
        public List<Holiday>? Holidays { get; set; }
    }
}
