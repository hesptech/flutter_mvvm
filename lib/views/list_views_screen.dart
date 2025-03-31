import 'package:flutter/material.dart';
import 'package:flutter_mvvm/views/list_views_view.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  ListViewScreenState createState() => ListViewScreenState();
}

class ListViewScreenState extends State<ListViewScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Column(
            children: [
              Text(
                'Logic:\nModel object Class methods \nUI:\nsetState', 
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          toolbarHeight: 200,
          backgroundColor: Colors.grey[500],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'List View', icon: Icon(Icons.abc),),
              Tab(text: 'Tab 2', icon: Icon(Icons.abc),),
              Tab(text: 'Tab 3', icon: Icon(Icons.abc),),
            ],
          ),
        ),  
        //body: const ListViewsView(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          viewportFraction: 0.9,
          children: [
            const ListViewsView(),
            Container(
              color: Colors.blue,
              //width: MediaQuery.of(context).size.width / 3,
            ),
            Container(
              color: Colors.red,
              //width: MediaQuery.of(context).size.width / 3,
            ),
          ],
        ),
      
        /* floatingActionButton: Column(
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
        ), */
      
      ),
    );
  }
}