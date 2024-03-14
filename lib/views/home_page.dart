import 'package:flutter/material.dart';
import '../views_models/item_list_view_model.dart';
//import 'package:flutter_mvvm/models/model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late ItemListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ItemListViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM Architecture'),
        centerTitle: true,
      ),  
      body: ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_viewModel.items[index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.addItem('New Item');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}