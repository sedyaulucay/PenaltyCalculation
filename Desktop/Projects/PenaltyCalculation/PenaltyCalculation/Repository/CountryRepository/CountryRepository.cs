using PenaltyCalculation.Data;
using PenaltyCalculation.Models;

namespace PenaltyCalculation.Repository.CountryRepository
{
    public class CountryRepository : ICountryRepository
    {
        private readonly ApplicationDbContext _appDbContext;

        public CountryRepository(ApplicationDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        /// <summary>
        /// Gets countries from db.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Country> GetCountries()
        {
            return _appDbContext.Countries.ToList();

        }

        /// <summary>
        /// Gets penalty price for selected country.
        /// </summary>
        /// <param name="inputModel"></param>
        /// <returns></returns>
        public decimal GetPenaltyPriceForCountry(InputModel inputModel)
        {
            return _appDbContext.Countries.Where(p => p.CountryId == inputModel.Country.CountryId).Select(x => x.PenaltyAmount).FirstOrDefault();
        }

        /// <summary>
        /// Gets penalty days limit for selected country.
        /// </summary>
        /// <param name="inputModel"></param>
        /// <returns></returns>
        public int GetPenaltyDaysLimitForCountry(InputModel inputModel)
        {
            return _appDbContext.Countries.Where(p => p.CountryId == inputModel.Country.CountryId).Select(x => x.PenaltyDayCount).FirstOrDefault();
        }
    }
}