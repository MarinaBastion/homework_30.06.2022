namespace WeatherApi.Core.DTO{
    public class WeatherRequestDto
    {
        public string? Key { get; set; }
        public string? Q { get; set; }
        public string? Days { get; set; }
        public string? Aqi { get; set; }
        public string? Alerts { get; set; }
    }
}