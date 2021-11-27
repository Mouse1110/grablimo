import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_my_train/src/model/client.dart';
import 'package:flutter_my_train/src/views/login/login.dart';
import 'package:flutter_my_train/src/views/staff/map.dart';
import 'package:provider/provider.dart';

import 'src/model/staff.dart';

void main() {
  GoogleMap.init('AIzaSyB95RXOzdsh9JtGrD9YCzb-oTga_7eYmw4');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => StaffModel()),
          ChangeNotifierProvider(create: (_) => ClientModel()),
        ],
        child: StaffMap(),
      ),
    );
  }
}
