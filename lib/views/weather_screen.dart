import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mvvm/views_models/weather_viewmodel.dart';

 class WeatherScreen extends StatelessWidget {
  final WeatherViewModel weatherViewModel = WeatherViewModel();
  

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: ChangeNotifierProvider(
        create: (_) => weatherViewModel,
        child: Consumer<WeatherViewModel>(
          builder: (context, model, child) {

            weatherViewModel.fetchWeather();
            
            if (model.weather == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Temperature: ${model.weather!.temperature}'),
                  Text('Condition: ${model.weather!.condition}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}