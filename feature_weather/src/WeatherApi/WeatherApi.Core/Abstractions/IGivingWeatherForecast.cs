using System.Threading.Tasks;
using WeatherApi.Core.DTO;

namespace  WeatherApi.Core.Abstractions
{
    public interface IGivingWeatherForecast
    {
        Task<WeatherResponseDto?> GiveWeatherByCoordinates(WeatherRequestDto dto);
    }
}