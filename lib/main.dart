import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_my_train/src/model/client.dart';
import 'package:flutter_my_train/src/views/book/bill.dart';
import 'package:flutter_my_train/src/views/home/home.dart';
import 'package:flutter_my_train/src/views/login/login.dart';
import 'package:flutter_my_train/src/views/staff/home.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

import 'src/model/staff.dart';

void main() async {
  GoogleMap.init('AIzaSyB95RXOzdsh9JtGrD9YCzb-oTga_7eYmw4');
  WidgetsFlutterBinding.ensureInitialized();
  // await _determinePosition();
  await requestLocationPermission();
  runApp(
    MyApp(),
  );
}

Future<void> requestLocationPermission() async {
  final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;

  bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

  final status = await Permission.locationWhenInUse.request();

  if (status == PermissionStatus.granted) {
    print('Permission Granted');
    await Geolocator.isLocationServiceEnabled();
  } else if (status == PermissionStatus.denied) {
    print('Permission denied');
  } else if (status == PermissionStatus.permanentlyDenied) {
    print('Permission Permanently Denied');
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
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
        child: Login(),
      ),
    );
  }
}
