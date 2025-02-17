import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mvvm/views_models/weather_viewmodel.dart';

 class WeatherScreen extends StatelessWidget {
  final WeatherViewModel weatherViewModel = WeatherViewModel();
  
  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {

    weatherViewModel.fetchWeather();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Logic:\nChangeNotifier notifyListeners\nUI:\nProvider ChangeNotifierProvider\nConsumer', 
          style: TextStyle(fontSize: 18),
        ),
        toolbarHeight: 200,
        backgroundColor: Colors.grey[500],
      ),
      body: ChangeNotifierProvider(
        create: (_) => weatherViewModel,


        child: Consumer<WeatherViewModel>(
          builder: (context, model, child) {
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