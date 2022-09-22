import 'package:flutter/material.dart';
import 'package:formation/providers/City.dart';

class CityAllNotifier extends ChangeNotifier {
  final List<City> _cityList = [
    City("Paris", DateTime.now(), {"latitude": 48.8534, "longitude": 2.3488}),
    City("London", DateTime.now(),
        {"latitude": 51.509865, "longitude": -0.118092}),
    City("Roma", DateTime.now(),
        {"latitude": 41.902782, "longitude": 12.496366}),
    City("Tokyo", DateTime.now(),
        {"latitude": 35.652832, "longitude": 139.839478}),
  ];

  List<City> get cityList => _cityList;
}
