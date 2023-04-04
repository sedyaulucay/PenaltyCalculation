using System.ComponentModel.DataAnnotations;

namespace PenaltyCalculation.Models
{
    public class InputModel
    {
        [Display(Name = "Book Check Out Date")]
        [Required(ErrorMessage = "Please enter book check out date!")]
        public DateTime? BookCheckOutDate { get; set; }

        [Display(Name = "Book Check In Date")]
        [Required(ErrorMessage = "Please enter book check in date!")]
        public DateTime? BookCheckInDate { get; set; }

        [Display(Name = "Country Selection")]
        [Required(ErrorMessage = "Please select country")]
        public Country? Country { get; set; }
    }
}
