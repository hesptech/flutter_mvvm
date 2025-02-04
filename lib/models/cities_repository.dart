import 'package:flutter_mvvm/models/city_model.dart';

class CitiesRepository {

  List<CityModel> cities = [
    CityModel(name: 'paris', country: 'france', ),
    CityModel(name: 'london', country: 'england', ),
    CityModel(name: 'berlin', country: 'germany', ),
  ];

}