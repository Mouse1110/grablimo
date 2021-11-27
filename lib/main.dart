import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_my_train/src/screen/page/staffhome/staffhome.dart';
import 'package:flutter_my_train/src/staffmodel/staffmodel.dart';
import 'package:provider/provider.dart';

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
        ],
        child: StaffHome(),
      ),
    );
  }
}
