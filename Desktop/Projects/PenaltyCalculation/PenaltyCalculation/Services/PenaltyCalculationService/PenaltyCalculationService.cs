using Microsoft.EntityFrameworkCore;
using PenaltyCalculation.Models;
using PenaltyCalculation.Repository.CountryRepository;
using PenaltyCalculation.Repository.HolidayRespository;

namespace PenaltyCalculation.Services.PenaltyCalculationService
{
    /// <summary>
    /// Penalty, business days and related helper methods service.
    /// </summary>
    public class PenaltyCalculationService : IPenaltyCalculationService
    {
        private readonly IHolidayRepository _holidayRepository;
        private readonly ICountryRepository _countryRepository;

        public PenaltyCalculationService(IHolidayRepository holidayRepository, ICountryRepository countryRepository)
        {
            _holidayRepository = holidayRepository;
            _countryRepository = countryRepository;
        }

        /// <summary>
        /// The method returns calculated business days by subtracting weekends and holidays depending on the country.
        /// </summary>
        /// <param name="inputModel"></param>
        /// <returns></returns>
        public int GetBusinessDays(InputModel inputModel)
        {
            int totalBusinessDays = 0;

            Country? country = _countryRepository.GetCountries().FirstOrDefault(p => p.CountryId == inputModel.Country.CountryId);
            var holidays = _holidayRepository.GetHolidays().Where(p => p.CountryId == inputModel.Country.CountryId).Select(x => x.Date);

            for (DateTime date = (DateTime)inputModel.BookCheckOutDate; date <= inputModel.BookCheckInDate; date = date.AddDays(1))
            {
                if (!holidays.Contains(date) && date.DayOfWeek.ToString() != country.OffDay1 && date.DayOfWeek.ToString() != country.OffDay2)
                {
                    totalBusinessDays++;
                }
            }

            return totalBusinessDays;
        }

        /// <summary>
        /// The method returns dynamic object that are calculated total price according to penalty day limit and country specific amount.
        /// </summary>
        /// <param name="inputModel"></param>
        /// <returns></returns>
        public OutputModel Calculate(InputModel inputModel)
        {
            int penaltyDayCount = _countryRepository.GetPenaltyDaysLimitForCountry(inputModel);

            decimal penaltyPrice = _countryRepository.GetPenaltyPriceForCountry(inputModel);

            decimal totalPrice = GetBusinessDays(inputModel) > penaltyDayCount ? (GetBusinessDays(inputModel) - penaltyDayCount) * penaltyPrice : 0;

            string currencySymbol = _countryRepository.GetCountries().FirstOrDefault(p => p.CountryId == inputModel.Country.CountryId).CurrencyCode.ToString();

            int penaltyDays = GetBusinessDays(inputModel) > penaltyDayCount ? GetBusinessDays(inputModel) - penaltyDayCount : 0;

            return new OutputModel()
            {
                BusinessDays = GetBusinessDays(inputModel),
                CurrencySymbol = currencySymbol,
                PenaltyDays = penaltyDays,
                TotalPrice = totalPrice,
            };
        }
    }
}