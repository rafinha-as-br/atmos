import 'package:flutter/material.dart';
import '../../../../app/providers/location_controller.dart';

class ForecastDisplayWidget extends StatelessWidget {
  const ForecastDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocationController().coordinates,
      builder: (context, coordinates, child) {
        if (coordinates == null) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '5-Day Forecast',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Day'),
                          Icon(Icons.wb_sunny_outlined),
                          Text('--°/--°'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
