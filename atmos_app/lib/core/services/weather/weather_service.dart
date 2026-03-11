import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../entities/city.dart';
import 'weather_api_key.dart';

class WeatherService {
  static final WeatherService _instance = WeatherService._internal();
  factory WeatherService() => _instance;
  WeatherService._internal();

  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<City?> getCurrentWeather(double lat, double lon) async {
    final url = Uri.parse('$_baseUrl/weather?lat=$lat&lon=$lon&appid=${WeatherApiKey.key}&units=metric');
    
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.statusCode == 200 ? response.body : '');
        final dto = _CurrentWeatherDto.fromJson(data);
        return dto.toEntity();
      }
    } catch (e) {
      // Log error
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getForecast(double lat, double lon) async {
    final url = Uri.parse('$_baseUrl/forecast?lat=$lat&lon=$lon&appid=${WeatherApiKey.key}&units=metric');
    
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // In a real scenario, we would map to a 5-day forecast list
        return []; 
      }
    } catch (e) {
      // Log error
    }
    return null;
  }
}

class _CurrentWeatherDto {
  final String name;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;

  _CurrentWeatherDto({
    required this.name,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  });

  factory _CurrentWeatherDto.fromJson(Map<String, dynamic> json) {
    return _CurrentWeatherDto(
      name: json['name'] ?? '',
      temp: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
    );
  }

  City toEntity() {
    return City(
      name: name,
      currentTemperature: temp,
      thermalSensation: feelsLike,
      humidity: humidity.toDouble(),
      windSpeed: windSpeed,
    );
  }
}
