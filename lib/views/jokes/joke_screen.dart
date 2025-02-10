import 'package:flutter/material.dart';
import 'package:flutter_mvvm/views/jokes/joke_view.dart';

final class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const JokeView(), maintainState: false),
                  );
                },
                child: const Text('Joke view'))
          ],
        ),
      ),
    );
  }
}