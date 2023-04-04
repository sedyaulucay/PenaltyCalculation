using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PenaltyCalculation.Migrations
{
    /// <inheritdoc />
    public partial class ModelEdits : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Id",
                table: "Holidays",
                newName: "HolidayId");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "Countries",
                newName: "CountryId");

            migrationBuilder.AddColumn<string>(
                name: "HolidayName",
                table: "Holidays",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "OffDay1",
                table: "Countries",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "OffDay2",
                table: "Countries",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_Holidays_CountryId",
                table: "Holidays",
                column: "CountryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Holidays_Countries_CountryId",
                table: "Holidays",
                column: "CountryId",
                principalTable: "Countries",
                principalColumn: "CountryId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Holidays_Countries_CountryId",
                table: "Holidays");

            migrationBuilder.DropIndex(
                name: "IX_Holidays_CountryId",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "HolidayName",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "OffDay1",
                table: "Countries");

            migrationBuilder.DropColumn(
                name: "OffDay2",
                table: "Countries");

            migrationBuilder.RenameColumn(
                name: "HolidayId",
                table: "Holidays",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "CountryId",
                table: "Countries",
                newName: "Id");
        }
    }
}
