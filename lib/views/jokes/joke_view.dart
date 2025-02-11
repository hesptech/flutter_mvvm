import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/services/service_locator.dart';
import 'package:flutter_mvvm/views/widgets/gradient_background.dart';
import 'package:flutter_mvvm/views/widgets/translucent_panel.dart';
import 'package:flutter_mvvm/views_models/joke_view_model.dart';

class JokeView extends StatelessWidget {
  const JokeView({super.key});

  @override
  Widget build(BuildContext context) {
    
    bool firstBuild = true;
    final jokeViewModel = sL<JokeViewModel>();
    
    return Scaffold(
      body: GradientBackground(
        colors: const [Colors.black, Colors.blue, Colors.black, Colors.purple],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TranslucentPanel(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ListenableBuilder(
                              listenable: jokeViewModel,
                              builder: (context, child) {
                                if (jokeViewModel.isLoading) {
                                  return const CircularProgressIndicator();
                                } else {
                                  if (firstBuild) {
                                    jokeViewModel.fetchJoke().then((error) {
                                      if (error != null) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          _showSnackbar(context, error);
                                        });
                                      }
                                    });
                                    firstBuild = false;
                                  }
                                  return SingleChildScrollView(
                                    child: Text(
                                      jokeViewModel.joke,
                                      style: const TextStyle(
                                          fontSize: 24, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  );
                                }
                              }),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TranslucentPanel(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {jokeViewModel.fetchJoke().then((error) {
                                      if (error != null) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          _showSnackbar(context, error);
                                        });
                                      }
                                    });},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, double.infinity),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child:
                            const Text('Next Joke', style: TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(context, error) {
    var snackBar = SnackBar(
      content: Text(error),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}