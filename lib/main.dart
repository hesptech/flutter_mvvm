import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/services/service_locator.dart';
import 'package:flutter_mvvm/views/custom_bottom_navigation.dart';

void main() {
  ServiceLocator.createInstances();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const CustomBottomNavigation(),
    );
  }
}
