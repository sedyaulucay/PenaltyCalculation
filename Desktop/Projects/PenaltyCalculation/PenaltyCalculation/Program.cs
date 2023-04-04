using Microsoft.EntityFrameworkCore;
using PenaltyCalculation.Data;
using PenaltyCalculation.Repository.CountryRepository;
using PenaltyCalculation.Repository.HolidayRespository;
using PenaltyCalculation.Services.ValidationService;
using PenaltyCalculation.Services.PenaltyCalculationService;

var builder = WebApplication.CreateBuilder(args);

//Sql connection add
builder.Services.AddDbContext<ApplicationDbContext>(options =>
            options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddScoped<IPenaltyCalculationService, PenaltyCalculationService>();
builder.Services.AddScoped<ICountryRepository, CountryRepository>();
builder.Services.AddScoped<IHolidayRepository, HolidayRepository>();
builder.Services.AddScoped<IValidationService, ValidationService>();

// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
