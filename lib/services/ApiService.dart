import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:formation/models/film.dart';

class ApiService {
  Future<List<Film>> getFilms(String searchValue) async {
    const String filmUrl = "https://ghibliapi.herokuapp.com/films";

    Response response = await Dio().get(filmUrl);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      List<Film> films = data.map((e) => Film.fromJson(e)).toList();

      if (searchValue.isNotEmpty) {
        return films
            .where((element) => element.title!
                .contains(RegExp(searchValue, caseSensitive: false)))
            .toList();
      }

      return films;
    } else {
      throw response.extra;
    }
  }
}
