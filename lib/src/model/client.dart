import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/model/otd/book.dart';
import 'package:flutter_my_train/src/model/otd/user.dart';

class ClientModel extends ChangeNotifier {
  BookOTD book;
  BookOTD bookIndex;
  UserOTD user;

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
