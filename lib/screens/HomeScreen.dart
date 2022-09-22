import 'package:flutter/material.dart';
import 'package:formation/services/ApiService.dart';
import 'package:formation/widget/common/AppDrawerWidget.dart';
import 'package:formation/providers/AppNotifier.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../widget/common/AppBottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  onClickNavigationBar(int value, BuildContext context) {
    context.read<AppNotifier>().selectedIndex = value;
    context.read<AppNotifier>().switchNavbarHeaderText(value);
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomImage = random.nextInt(10);
    return Scaffold(
        appBar: AppBar(
          title: Text(context.watch<AppNotifier>().appBarHomeText),
          actions: [
            if (context.read<AppNotifier>().selectedIndex == 2)
              IconButton(
                  onPressed: () {
                    bool lastValue =
                        context.read<AppNotifier>().isSearchButtonVisible;
                    context.read<AppNotifier>().isSearchButtonVisible =
                        !lastValue;
                  },
                  icon: context.watch<AppNotifier>().isSearchButtonVisible
                      ? const Icon(Icons.search_off)
                      : const Icon(Icons.search))
          ],
        ),
        bottomNavigationBar: AppBottomNavigationBar(
          onClickBottomNavigation: (int value) {
            widget.onClickNavigationBar(value, context);
          },
          currentIndex: context.read<AppNotifier>().selectedIndex,
        ),
        drawer: AppDrawerWidget(randomImage: randomImage),
        body: context.watch<AppNotifier>().navigationPageCurrent);
  }
}
