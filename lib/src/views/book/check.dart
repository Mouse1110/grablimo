import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/utils/push.dart';
import 'package:flutter_my_train/src/views/home/home.dart';

class BookCheck extends StatelessWidget {
  const BookCheck({Key key}) : super(key: key);

  Widget scaffold() => Scaffold(
        body: Container(
          color: const Color.fromRGBO(255, 152, 94, 1),
          alignment: Alignment.center,
          child: Container(
            width: 150,
            height: 150,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Image.asset(
              'assets/check.png',
              width: 128,
              height: 128,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Push.nextClientSave(context: context, page: Home());
    });
    return scaffold();
  }
}
