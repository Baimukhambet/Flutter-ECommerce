import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int currentTabIndex = 0;

  void changeCurrentTab(int newIndex) {
    currentTabIndex = newIndex;
    notifyListeners();
  }
}
