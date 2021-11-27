import 'package:flutter/material.dart';

class StaffModel extends ChangeNotifier {
  int initPage = 0;

  void changeInitPage(int i) {
    i = initPage;
    notifyListeners();
  }
}
