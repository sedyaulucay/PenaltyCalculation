using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PenaltyCalculation.Migrations
{
    /// <inheritdoc />
    public partial class PenaltyDaysLimitAdd : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PenaltyDayCount",
                table: "Countries",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PenaltyDayCount",
                table: "Countries");
        }
    }
}
