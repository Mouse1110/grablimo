import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/screen/page/staffhome/staffhome.dart';
import 'package:flutter_my_train/src/screen/page/stafflocation/stafflocation.dart';
import 'package:flutter_my_train/src/screen/page/staffmap/staffmap.dart';

class Config {
  static List<Widget> configPage = [
    StaffHome(),
    StaffLocation(),
    StaffMap(),
  ];
}
