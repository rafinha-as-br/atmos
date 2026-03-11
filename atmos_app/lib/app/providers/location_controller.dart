import 'package:flutter/foundation.dart';

class LocationController {
  static final LocationController _instance = LocationController._internal();
  factory LocationController() => _instance;
  LocationController._internal();

  final ValueNotifier<(double lat, double lon)?> _coordinates = ValueNotifier(null);
  
  ValueListenable<(double lat, double lon)?> get coordinates => _coordinates;

  void updateCoordinates(double lat, double lon) {
    _coordinates.value = (lat, lon);
  }
}
