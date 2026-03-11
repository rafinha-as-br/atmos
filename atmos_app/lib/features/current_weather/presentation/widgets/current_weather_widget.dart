import 'package:flutter/material.dart';
import '../../../../app/providers/location_controller.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocationController().coordinates,
      builder: (context, coordinates, child) {
        if (coordinates == null) {
          return const Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('Please search for a city')),
            ),
          );
        }

        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Lat: ${coordinates.$1.toStringAsFixed(2)}, Lon: ${coordinates.$2.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Weather API logic pending keys',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),
                const Text(
                  '--°C',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDetail('Sensation', '--°C'),
                    _buildDetail('Humidity', '--%'),
                    _buildDetail('Wind', '-- km/h'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetail(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
