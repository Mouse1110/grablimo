import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/model/otd/book.dart';
import 'package:flutter_my_train/src/model/otd/user.dart';
import 'package:geolocator/geolocator.dart';

class ClientModel extends ChangeNotifier {
  BookOTD book;
  BookOTD bookIndex;
  UserOTD user;
  Position position;

  void changePosition(Position position) {
    this.position = position;
    notifyListeners();
  }

  void changeUser(UserOTD user) {
    this.user = user;
    notifyListeners();
  }

  void changeBook(BookOTD book) {
    this.book = book;
    notifyListeners();
  }

  void changeBookIndex(BookOTD bookIndex) {
    this.bookIndex = bookIndex;
    notifyListeners();
  }
}
