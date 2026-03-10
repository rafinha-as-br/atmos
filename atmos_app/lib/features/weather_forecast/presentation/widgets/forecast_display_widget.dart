import 'package:flutter/material.dart';

class ForecastDisplayWidget extends StatelessWidget {
  const ForecastDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Text('20°/28°'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
