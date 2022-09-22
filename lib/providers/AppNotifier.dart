import 'package:flutter/cupertino.dart';
import 'package:formation/screens/CityScreen.dart';
import 'package:formation/screens/FilmScreen.dart';
import 'package:formation/screens/CalculatorTipsWidget.dart';
import 'package:formation/widget/HomeWidget.dart';

class AppNotifier extends ChangeNotifier {
  int _selectedIndex = 0;
  String appBarHomeText = "Presentation";
  Widget navigationPageCurrent = const HomeWidget();
  bool _isSearchButtonVisible = false;

  String _searchValue = "";

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  String get searchValue => _searchValue;

  set searchValue(String value) {
    _searchValue = value;
    notifyListeners();
  }

  bool get isSearchButtonVisible => _isSearchButtonVisible;

  set isSearchButtonVisible(bool value) {
    _isSearchButtonVisible = value;
    notifyListeners();
  }

  bool isSearchIconShow() {
    notifyListeners();
    return appBarHomeText == "Films";
  }

  String switchNavbarHeaderText(int value) {
    switch (value) {
      case 0:
        {
          appBarHomeText = "Presentation";
          navigationPageCurrent = const HomeWidget();
        }
        break;
      case 1:
        {
          appBarHomeText = "Calculator";
          navigationPageCurrent = CalculatorTipsWidget();
        }
        break;
      case 2:
        {
          appBarHomeText = "Studio Guibli";
          navigationPageCurrent = FilmScreen();
        }
        break;
      case 3:
        {
          appBarHomeText = "All Cities";
          navigationPageCurrent =  CityScreen();
        }
        break;
      default:
        {
          appBarHomeText = "App Fabien";
        }
        break;
    }
    notifyListeners();

    return appBarHomeText;
  }
}
