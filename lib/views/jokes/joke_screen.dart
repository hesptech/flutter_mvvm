import 'package:flutter/material.dart';
import 'package:flutter_mvvm/views/jokes/joke_view.dart';

final class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              Text(
                'abstract interface Class\nService Locator get_it dio\nLogic:\nChangeNotifier notifyListeners\nUI:\nListenableBuilder\nsL Service Locator', 
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              /* TabBar(
                tabs: [
                  Tab(text: 'Joke'),
                  Tab(text: 'Tab 4'),
                  Tab(text: 'Tab 3'),
                ],
              ), */
            ],
          ),
          toolbarHeight: 235,
          backgroundColor: Colors.grey[500],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Joke', icon: Icon(Icons.abc),),
              Tab(text: 'Tab 2', icon: Icon(Icons.abc),),
              Tab(text: 'Tab 3', icon: Icon(Icons.abc),),
            ],
          ),
        ),
        body: Center(
          child: SizedBox(
            height: 50,
            width: 200,
            child: TabBarView(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const JokeView(), maintainState: false),
                    );
                  },
                  child: const Text('Joke view'),
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}