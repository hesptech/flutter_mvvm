import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/services/service_locator.dart';
import 'package:flutter_mvvm/views/list_views_screen.dart';
import 'package:flutter_mvvm/views/jokes/joke_screen.dart';
import 'package:flutter_mvvm/views/weather_screen.dart';

void main() {
  ServiceLocator.createInstances();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          //child: ListViewScreen(),
          //child: WeatherScreen(),
          child: JokeScreen(),
        ),
      ),
    );
  }
}
