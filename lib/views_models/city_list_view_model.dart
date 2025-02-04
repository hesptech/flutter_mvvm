import 'package:flutter_mvvm/models/cities_repository.dart';
import 'package:flutter_mvvm/models/city_model.dart';

class CityListViewModel  {

  final CitiesRepository citiesRepository = CitiesRepository();

  List<String> get cities => citiesRepository.cities.map((e) => e.country).toList();

  void addCity({required String city, required String country}) {
    citiesRepository.cities.add(CityModel(name: city, country: country));
    print(citiesRepository.cities[3].name);
  }
}