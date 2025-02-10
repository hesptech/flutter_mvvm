


import 'package:get_it/get_it.dart';
import 'package:flutter_mvvm/models/joke_service.dart';
//import 'package:flutter_mvvm/models/joke_service_interface.dart';
import 'package:flutter_mvvm/views_models/joke_view_model.dart';

final sL = GetIt.instance;
final class ServiceLocator {
  ServiceLocator._();
  
  static void createInstances() {
    // register concrete types without abstract class
    sL.registerLazySingleton<JokeServiceInterface>(() => JokeService());

    // using an abstract base class as a registration type so that you can vary the implementations
    sL.registerFactory<JokeViewModel>(
       () => JokeViewModel(jokeService: sL<JokeServiceInterface>()));
  }
} 