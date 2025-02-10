import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/services/service_locator.dart';
import 'package:flutter_mvvm/views/home_page.dart';
import 'package:flutter_mvvm/views/joke_screen.dart';
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
          //child: HomePage(),
          //child: WeatherScreen(),
          child: JokeScreen(),
        ),
      ),
    );
  }
}
