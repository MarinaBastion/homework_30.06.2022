using SharedModel;
using System;
using MassTransit;
using System.Threading.Tasks;
using System.Linq;
using WeatherApi.Core.Abstractions;
using Microsoft.AspNetCore.Mvc;
using WeatherApi.Core.DTO;

namespace WeatherApi.WebHost.Consumers {
    public class WeatherForecastConsumer : 
        IConsumer<WeatherRequest>
    {
        readonly  IGivingWeatherForecast _givingWeatherForecast;
        public WeatherForecastConsumer(IGivingWeatherForecast givingWeatherForecast)
        {
            _givingWeatherForecast = givingWeatherForecast;
        }
        public async Task Consume(ConsumeContext<WeatherRequest> context)
        {
            WeatherRequestDto request = new WeatherRequestDto{ Aqi = context.Message.Aqi, Alerts = context.Message.Alerts,
            Key = context.Message.Key, Q = context.Message.Q, Days = context.Message.Days} ;
            var response = await _givingWeatherForecast.GiveWeatherByCoordinates(request);
            if (response == null)
                throw new InvalidOperationException("Order not found");
            
            await context.RespondAsync<WeatherResponse>(new 
            {
               Location = response.location,
               Current = response.current,
               Forecast = response.forecast
            });
        }
    }
}