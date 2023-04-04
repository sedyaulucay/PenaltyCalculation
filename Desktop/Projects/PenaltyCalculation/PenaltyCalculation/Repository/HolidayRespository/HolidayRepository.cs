using PenaltyCalculation.Data;
using PenaltyCalculation.Models;

namespace PenaltyCalculation.Repository.HolidayRespository
{
    public class HolidayRepository : IHolidayRepository
    {
        private readonly ApplicationDbContext _appDbContext;

        public HolidayRepository(ApplicationDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        /// <summary>
        /// Gets holidays from db.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Holiday> GetHolidays()
        {
            IEnumerable<Holiday> holidayList = _appDbContext.Holidays.ToList();

            return holidayList;

        }
    }
}