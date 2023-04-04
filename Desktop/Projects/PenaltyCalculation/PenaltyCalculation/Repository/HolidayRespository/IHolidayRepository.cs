using PenaltyCalculation.Models;

namespace PenaltyCalculation.Repository.HolidayRespository
{
    /// <summary>
    /// HolidayRepository interface.
    /// </summary>
    public interface IHolidayRepository
    {
        IEnumerable<Holiday> GetHolidays();
    }
}