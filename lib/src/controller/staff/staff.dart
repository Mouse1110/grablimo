import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/model/otd/book.dart';
import 'package:flutter_my_train/src/model/staff.dart';
import 'package:flutter_my_train/src/utils/url.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class StaffController {
  BuildContext context;
  StaffModel model;
  StaffController({this.context}) {
    model = Provider.of<StaffModel>(context, listen: false);
  }

  void addLocation(List<BookOTD> list) {
    model.changeList(list);
  }

  // class <cac kieu du lieu (int, string list) > name (){object}
  Future<List<BookOTD>> get() async {
    var url = Uri.parse('${link}book');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return null;
    }
    List<BookOTD> data = (jsonDecode(response.body) as List) // tra ve list
        .map((e) => BookOTD.fromJson(e)) // loc ra tung phan tu
        .toList(); // convert
    return data;
  }
}
