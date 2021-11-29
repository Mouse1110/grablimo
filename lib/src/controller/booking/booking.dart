import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_my_train/src/model/client.dart';
import 'package:flutter_my_train/src/model/otd/book.dart';
import 'package:flutter_my_train/src/utils/url.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BookingController {
  BuildContext context;
  ClientModel model;
  BookingController({this.context}) {
    model = Provider.of<ClientModel>(context, listen: false);
  }

  void addLocation(BookOTD book) {
    model.changeBook(book);
  }

  Future<Position> getCurrent() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<bool> post({@required BookOTD book}) async {
    var url = Uri.parse('${link}book');
    var response = await http.post(url,
        body: {'book': jsonEncode(book.toJson()), 'user': model.user.id});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  Future<BookOTD> getBook({@required String phone}) async {
    var url = Uri.parse('${link}user/book' + '?p=$phone');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return null;
    }
    if (jsonDecode(response.body)['err'] != 0) {
      return null;
    }
    BookOTD book = BookOTD.fromJson(jsonDecode(response.body)['data']);
    print(book.date);
    return book;
  }
}
