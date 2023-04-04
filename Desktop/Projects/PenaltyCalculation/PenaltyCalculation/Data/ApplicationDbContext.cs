using Microsoft.EntityFrameworkCore;
using PenaltyCalculation.Models;
using System.Collections.Generic;

namespace PenaltyCalculation.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public virtual DbSet<Country> Countries { get; set; }

        public virtual DbSet<Holiday> Holidays { get; set; }
    }

}
