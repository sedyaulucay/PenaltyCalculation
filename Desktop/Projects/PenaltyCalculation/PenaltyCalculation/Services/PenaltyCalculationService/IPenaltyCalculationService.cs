using PenaltyCalculation.Models;

namespace PenaltyCalculation.Services.PenaltyCalculationService
{
    /// <summary>
    /// PenaltyCalculationService interface.
    /// </summary>
    public interface IPenaltyCalculationService
    {
        OutputModel Calculate(InputModel inputModel);
        int GetBusinessDays(InputModel inputModel);
    }
}
