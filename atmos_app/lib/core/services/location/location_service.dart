import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  final String _baseUrl = 'https://nominatim.openstreetmap.org/search';

  Future<List<LocationSuggestion>> getSuggestions(String query) async {
    final url = Uri.parse('$_baseUrl?q=$query&format=json&limit=5');
    
    try {
      final response = await http.get(
          url,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.11'
          }
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('data: ${data}');
        return data.map((item) => _NominatimResultDto.fromJson(item).toSuggestion()).toList();
      }

    } catch (e) {
      // Log error
    }
    return [];
  }
}

class LocationSuggestion {
  final String displayName;
  final double lat;
  final double lon;

  LocationSuggestion({
    required this.displayName,
    required this.lat,
    required this.lon,
  });
}

class _NominatimResultDto {
  final String displayName;
  final double lat;
  final double lon;

  _NominatimResultDto({
    required this.displayName,
    required this.lat,
    required this.lon,
  });

  factory _NominatimResultDto.fromJson(Map<String, dynamic> json) {
    return _NominatimResultDto(
      displayName: json['display_name'] ?? '',
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
    );
  }

  LocationSuggestion toSuggestion() {
    return LocationSuggestion(
      displayName: displayName,
      lat: lat,
      lon: lon,
    );
  }
}
