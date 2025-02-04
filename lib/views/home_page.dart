import 'package:flutter/material.dart';
import '../views_models/item_list_view_model.dart';
import 'package:flutter_mvvm/views_models/city_list_view_model.dart';
//import 'package:flutter_mvvm/models/model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late ItemListViewModel _viewModel;
  late CityListViewModel _cityListViewModel2;

  @override
  void initState() {
    super.initState();
    _viewModel = ItemListViewModel();
    _cityListViewModel2 = CityListViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM Architecture'),
        centerTitle: true,
      ),  
      /* body: ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_viewModel.items[index]));
        },
      ), */
      body: ListView.builder(
        itemCount: _cityListViewModel2.cities.length, 
        itemBuilder: (context, index) {
          return ListTile(title: Text(_cityListViewModel2.cities[index]));
        },
      ),




      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.addItem('New Item');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ), */

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cityListViewModel2.addCity(city: 'New City', country: 'New Country');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}