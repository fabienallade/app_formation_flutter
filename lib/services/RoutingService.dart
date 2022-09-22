import 'package:formation/screens/CityScreen.dart';
import 'package:formation/screens/FilmDetailsScreen.dart';
import 'package:formation/screens/HomeScreen.dart';
import 'package:go_router/go_router.dart';

import '../models/film.dart';

class RoutingService {
  static GoRouter generateRoutes() {
    return GoRouter(routes: [
      GoRoute(
          path: "/",
          name: "home",
          builder: (context, state) => const HomeScreen()),
      GoRoute(
          path: "/film_detail/:film_id",
          name: "film_detail",
          builder: (context, state) => FilmDetailsScreen(
                filmId: state.params["film_id"],
                film: state.extra as Film,
              ))
    ]);
  }
}
