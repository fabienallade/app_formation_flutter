import 'package:flutter/material.dart';
import 'package:formation/models/film.dart';
import 'package:formation/providers/AppNotifier.dart';
import 'package:formation/services/ApiService.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FilmScreen extends StatelessWidget {
  final ApiService _apiService = ApiService();

  FilmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: context.watch<AppNotifier>().isSearchButtonVisible,
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Search by title",
                ),
                onChanged: (String? value) {
                  if (value != null) {
                    context.read<AppNotifier>().searchValue = value;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ]),
          ),
          const Text(
            "Movies",
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 15,
          ),
          FutureBuilder(
              future: _apiService
                  .getFilms(context.watch<AppNotifier>().searchValue),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Film>> snapShot) {
                if (snapShot.hasData) {
                  final data = snapShot.data!;
                  return Expanded(
                    child: data.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final Film film = data.elementAt(index);
                              return ListTile(
                                leading: Image.network(film.movieBanner!),
                                title: Text(film.title!),
                                subtitle: Text(film.originalTitle!),
                                trailing: const Icon(Icons.navigate_next),
                                onTap: () {
                                  context.pushNamed("film_detail",
                                      params: {"film_id": "$index"},
                                      extra: film);
                                },
                              );
                            },
                          )
                        : const Center(
                            child: Text("Aucun film trouvé"),
                          ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
