import 'package:flutter/material.dart';
import 'package:flutter_mvvm/views/list_views_screen.dart';
import 'package:flutter_mvvm/views/weather_screen.dart';
import 'package:flutter_mvvm/views/jokes/joke_screen.dart';
import 'package:flutter_mvvm/views_models/weather_viewmodel.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentPageIndex = 0;
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
   
      body: <Widget>[
        /// Home page
        const ListViewScreen(),
        WeatherScreen(),
        const JokeScreen(),
      ][currentPageIndex],
    
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          //if(index == 0 || index == 2 ) WeatherViewModel().cancelListen.value = false;
          WeatherViewModel().disposeValues();
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.playlist_add_outlined),
            icon: Icon(Icons.playlist_add_outlined),
            label: 'Lists',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              child: Icon(Icons.thermostat),
            ),
            icon: Badge(
              child: Icon(Icons.thermostat_outlined),
            ),
            label: 'Notifications',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2'),
              child: Icon(Icons.sentiment_very_satisfied_outlined),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.sentiment_satisfied_alt_outlined),
            ),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}