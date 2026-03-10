import 'package:flutter/material.dart';
import '../../../current_weather/presentation/widgets/current_weather_widget.dart';
import '../../../weather_forecast/presentation/widgets/forecast_display_widget.dart';
import '../../../../app/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atmos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.search);
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CurrentWeatherWidget(),
            ForecastDisplayWidget(),
          ],
        ),
      ),
    );
  }
}
