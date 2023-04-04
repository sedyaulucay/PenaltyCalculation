namespace PenaltyCalculation.Models
{
    public class OutputModel
    {
        public decimal TotalPrice { get; set; }
        public int BusinessDays { get; set; }
        public int PenaltyDays { get; set; }
        public string? CurrencySymbol { get; set; }
    }
}
