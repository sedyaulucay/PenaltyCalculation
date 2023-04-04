using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace PenaltyCalculation.Services.ValidationService
{
    public class ValidationService : IValidationService
    {
        public string CheckErrorMessages(IEnumerable<ModelError> values)
        {
            foreach (var modelState in values)
            {
                return modelState.ErrorMessage;
            }
            return string.Empty;
        }
    }
}