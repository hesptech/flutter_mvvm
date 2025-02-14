import 'package:flutter/material.dart';
import '../views_models/item_list_view_model.dart';
import 'package:flutter_mvvm/views_models/city_list_view_model.dart';
//import 'package:flutter_mvvm/models/model.dart';


class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  ListViewScreenState createState() => ListViewScreenState();
}

class ListViewScreenState extends State<ListViewScreen> {
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
        title: const Text(
          'Logic:\nModel object Class methods \nUI:\nsetState', 
          style: TextStyle(fontSize: 20),
        ),
        toolbarHeight: 150,
        backgroundColor: Colors.grey[500],
      ),  
      /* body: ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_viewModel.items[index]));
        },
      ), */
      body: Column(
        children: [
          Container(
            height: 200,
            color: const Color.fromARGB(255, 226, 114, 106),
            child: ListView.builder(
              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _viewModel.items.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_viewModel.items[index]));
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _cityListViewModel2.cities.length, 
              itemBuilder: (context, index) {
                return ListTile(title: Text(_cityListViewModel2.cities[index]));
              },
            ),
          ),
          const Text('data')

        ],
      ),


      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _viewModel.addItem('New Item');
              setState(() {});
            },
            heroTag: null,
            child: const Icon(
              Icons.add_card
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(           
            onPressed: () {
              _cityListViewModel2.addCity(city: 'New City', country: 'New Country');
              setState(() {});
            },
            heroTag: null,           
            child: const Icon(
              Icons.location_city
            ),
          )
        ]
      ),

      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.addItem('New Item');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ), */

      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cityListViewModel2.addCity(city: 'New City', country: 'New Country');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ), */
    );
  }
}