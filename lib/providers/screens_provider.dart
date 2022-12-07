import 'package:flutter/material.dart';

class ScreensProvider with ChangeNotifier {

  int _homeScreenNumber = 1 ;

  int get homeScreenNumber => _homeScreenNumber;

  void setHomeScreenNumber(int value) {
    _homeScreenNumber = value;
    notifyListeners();
  }
}
