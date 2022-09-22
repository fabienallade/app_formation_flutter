import 'package:flutter/material.dart';
import 'package:formation/providers/AppNotifier.dart';
import 'package:provider/provider.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final Function(int value) onClickBottomNavigation;
  int currentIndex;

  AppBottomNavigationBar(
      {Key? key,
      required this.onClickBottomNavigation,
      required this.currentIndex})
      : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<AppNotifier>().selectedIndex,
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.present_to_all),
          label: "Presentation",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.calculate), label: "Calculate"),
        BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Films"),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_city), label: "Cities"),
      ],
      onTap: (int value) {
        widget.onClickBottomNavigation(value);
      },
    );
  }
}
