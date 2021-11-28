import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_my_train/src/model/client.dart';
import 'package:flutter_my_train/src/model/otd/user.dart';
import 'package:flutter_my_train/src/utils/url.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginController {
  BuildContext context;
  ClientModel model;
  LoginController({@required this.context}) {
    model = Provider.of<ClientModel>(context, listen: false);
  }

  Future<UserOTD> login({@required String phone, @required String pass}) async {
    var url = Uri.parse('${link}login');
    var response = await http.post(url, body: {'phone': phone, 'pass': pass});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return null;
    }
    if (jsonDecode(response.body)['err'] != 0) {
      return null;
    }
    UserOTD data = UserOTD.fromJson(jsonDecode(response.body)['data']);
    return data;
  }

  Future<UserOTD> signup({
    @required UserOTD user,
  }) async {
    var url = Uri.parse('${link}signup');
    var response = await http.post(url, body: user.toJson());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return null;
    }
    if (jsonDecode(response.body)['err'] != 0) {
      return null;
    }
    UserOTD data = UserOTD.fromJson(jsonDecode(response.body)['data']);
    return data;
  }
}
