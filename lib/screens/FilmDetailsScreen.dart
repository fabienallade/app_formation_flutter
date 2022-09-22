import 'package:flutter/material.dart';
import 'package:formation/services/ApiService.dart';

import '../models/film.dart';

class FilmDetailsScreen extends StatelessWidget {
  final String? filmId;
  final Film film;

  const FilmDetailsScreen({Key? key, required this.filmId, required this.film})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title!),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              film.title!,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(film.originalTitle!),
            const SizedBox(
              height: 10,
            ),
            Image.network(film.movieBanner!),
            const SizedBox(
              height: 10,
            ),
            Text(film.description!)
          ],
        ),
      ),
    );
  }
}
