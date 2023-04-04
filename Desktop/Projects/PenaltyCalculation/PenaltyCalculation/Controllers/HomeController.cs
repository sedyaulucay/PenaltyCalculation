using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using PenaltyCalculation.Models;
using PenaltyCalculation.Repository.CountryRepository;
using PenaltyCalculation.Repository.HolidayRespository;
using PenaltyCalculation.Services.PenaltyCalculationService;
using PenaltyCalculation.Services.ValidationService;

namespace PenaltyCalculation.Controllers
{
    public class HomeController : Controller
    {
        private readonly IPenaltyCalculationService _penaltyCalculationService;
        private readonly IHolidayRepository _holidayRepository;
        private readonly ICountryRepository _countryRepository;
        private readonly IValidationService _validationService = new ValidationService();

        public HomeController(IPenaltyCalculationService penaltyCalculationService, IHolidayRepository holidayRepository, ICountryRepository countryRepository, IValidationService validationService)
        {
            _penaltyCalculationService = penaltyCalculationService;
            _holidayRepository = holidayRepository;
            _countryRepository = countryRepository;
            _validationService = validationService;
        }

        public ActionResult Index()
        {
            IEnumerable<Country>? countries = _countryRepository.GetCountries();
            ViewBag.CountryDropDownItems = SetDropDownListForCountry(countries);

            ViewBag.ShowResult = false;

            return View();
        }

        [HttpPost]
        public ActionResult Index(InputModel model)
        {
            var values = ModelState.Values.SelectMany(m => m.Errors);
            var errorMessage = _validationService.CheckErrorMessages(values);

            if (ModelState.IsValid)
            {
                var allResults = _penaltyCalculationService.Calculate(model);

                ViewBag.BusinessDays = allResults.BusinessDays;
                ViewBag.Penalty = allResults.TotalPrice;
                ViewBag.PenaltyDays = allResults.PenaltyDays;
                ViewBag.CurrencySymbol = allResults.CurrencySymbol;
                ViewBag.ShowResult = true;
            }
            else
            {
                ViewBag.ShowResult = false;
                var errors = ModelState.Select(x => x.Value.Errors)
                                       .Where(y => y.Count > 0)
                                       .ToList();
            }

            var countries = _countryRepository.GetCountries();
            ViewBag.CountryDropDownItems = SetDropDownListForCountry(countries);

            return View();
        }

        private static List<SelectListItem> SetDropDownListForCountry(IEnumerable<Country> countries)
        {
            return countries.Select(countryItem => new SelectListItem
            {
                Text = countryItem.Name,
                Value = countryItem.CountryId.ToString()
            }).ToList();
        }
    }
}