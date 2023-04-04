using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace PenaltyCalculation.Services.ValidationService
{
    /// <summary>
    /// ValidationService interface.
    /// </summary>
    public interface IValidationService
    {
        string CheckErrorMessages(IEnumerable<ModelError> values);
    }
}