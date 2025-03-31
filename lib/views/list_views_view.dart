import 'package:flutter/material.dart';
import '../views_models/item_list_view_model.dart';
import 'package:flutter_mvvm/views_models/city_list_view_model.dart';

class ListViewsView extends StatefulWidget {
  const ListViewsView({super.key});

  @override
  State<ListViewsView> createState() => _ListViewsViewState();
}

class _ListViewsViewState extends State<ListViewsView> {
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
    return 
  
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            children: [
        
        
              IconButton(
                onPressed: () {
                  _viewModel.addItem('New Item');
                  setState(() {});
                },
                icon: const Icon(
                  Icons.add_card
                ),
              ),
        
              Container(
                //height: 200,
                color: const Color.fromARGB(255, 226, 114, 106),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _viewModel.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(_viewModel.items[index]));
                  },
                ),
              ),
        
              IconButton(           
                onPressed: () {
                  _cityListViewModel2.addCity(city: 'New City', country: 'New Country');
                  setState(() {});
                },         
                icon: const Icon(
                  Icons.location_city
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
      );
    

  }
}