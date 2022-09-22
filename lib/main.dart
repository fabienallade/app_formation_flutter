import 'package:formation/providers/AppNotifier.dart';
import 'package:formation/providers/CityAllNotifier.dart';
import 'package:formation/services/RoutingService.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppNotifier()),
        ChangeNotifierProvider(create: (context) => CityAllNotifier())
      ],
      child: MaterialApp.router(
        routerConfig: RoutingService.generateRoutes(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
