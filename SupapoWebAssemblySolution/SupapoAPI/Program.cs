using SupapoAPI.dataContext;
using SupapoClassLib;
using SupapoClassLib.Model;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: "AllowBlazorOrigin", builder =>
    {
        builder.WithOrigins("https://localhost:7196", "http://localhost:5140").AllowAnyMethod().AllowAnyOrigin().AllowAnyHeader().WithMethods(); // Adjust origin based on your Blazor Wasm application's domain
    });
});


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSingleton<IProfile, Profile>();
builder.Services.AddSingleton<DataContext>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors("AllowBlazorOrigin");

app.UseAuthorization();

app.MapControllers();

app.Run();
