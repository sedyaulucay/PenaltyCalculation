using PenaltyCalculation.Models;

namespace PenaltyCalculation.Repository.CountryRepository
{
    /// <summary>
    /// CountryRepository inteface.
    /// </summary>
    public interface ICountryRepository
    {
        IEnumerable<Country> GetCountries();

        decimal GetPenaltyPriceForCountry(InputModel ınputModel);

        int GetPenaltyDaysLimitForCountry(InputModel ınputModel);
    }
}