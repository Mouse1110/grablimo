import 'package:flutter/material.dart';

import 'otd/book.dart';

class StaffModel extends ChangeNotifier {
  List<BookOTD> listBook = [];

  void changeList(List<BookOTD> list) {
    listBook = list;
    notifyListeners();
  }
}
