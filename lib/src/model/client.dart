import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/model/otd/book.dart';

class ClientModel extends ChangeNotifier {
  BookOTD book;

  void changeBook(BookOTD bookOTD) {
    book = bookOTD;
    notifyListeners();
  }
}
