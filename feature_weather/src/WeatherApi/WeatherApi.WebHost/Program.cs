using WeatherApi.DataAccess.Repositories;
using WeatherApi.Core.Abstractions;
using WeatherApi.Core.DTO;
using MassTransit;
using WeatherApi.WebHost.Settings;
using WeatherApi.WebHost.Consumers;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddHttpClient<IGivingWeatherForecast,GivingWeatherForecast>(c =>
    {
        c.BaseAddress = new Uri(builder.Configuration["IntegrationSettings:GivingWeatherForecastUrl"]);
    }
);

builder.Services.AddMassTransit(x =>
{
    x.AddConsumer<WeatherForecastConsumer>();

    x.AddBus(context => Bus.Factory.CreateUsingRabbitMq(c =>
    {
         var rabbitMQSettings = builder.Configuration.GetSection(nameof(RabbitMQSettings)).Get<RabbitMQSettings>();
        c.Host(rabbitMQSettings.Host);
        c.ReceiveEndpoint(rabbitMQSettings.Queue!, e =>
        {
            e.PrefetchCount = 16;
            e.UseMessageRetry(r => r.Interval(2, 3000));
            e.ConfigureConsumer<WeatherForecastConsumer>(context);
        });
    }));
});

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();




var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
 

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
