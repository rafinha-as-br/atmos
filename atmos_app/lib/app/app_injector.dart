import '../core/services/weather/weather_service.dart';
import '../core/services/location/location_service.dart';
import 'providers/location_controller.dart';

class AppInjector {
  static Future<void> init() async {
    // Services are singletons by implementation
    WeatherService();
    LocationService();
    LocationController();
  }
}
