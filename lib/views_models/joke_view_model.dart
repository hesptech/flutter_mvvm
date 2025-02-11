import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/joke_service.dart';

import '../models/joke_model.dart';

class JokeViewModel with ChangeNotifier {
  JokeServiceInterface jokeService;
  JokeViewModel({required this.jokeService});
  var joke = '';
  var isLoading = false;

  Future<String?> fetchJoke() async {
    String? error;
    isLoading = true;
    //notifyListeners();
    JokeModel jokeModel = await jokeService.fetchJoke();
    if (jokeModel.joke != null) {
      joke = jokeModel.joke!;
    } else {
      error = jokeModel.error;
    }
    isLoading = false;
    notifyListeners();
    return error;
  }
  
}