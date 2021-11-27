import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_my_train/src/utils/url.dart';
import 'package:http/http.dart' as http;

class LoginController {
  BuildContext context;
  LoginController({@required this.context});

  Future<bool> login({@required String name, @required String pass}) async {
    var url = Uri.parse('${link}login');
    var response = await http.post(url, body: {'name': name, 'pass': pass});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return false;
    }
    bool data = jsonDecode(response.body);
    return data;
  }
}
