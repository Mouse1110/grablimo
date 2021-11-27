import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_my_train/src/utils/colors.dart';
import 'package:permission_handler/permission_handler.dart';

class StaffMap extends StatefulWidget {
  const StaffMap({Key key}) : super(key: key);

  @override
  _StaffMapState createState() => _StaffMapState();
}

class _StaffMapState extends State<StaffMap> {
  GlobalKey<GoogleMapStateBase> _key = GlobalKey<GoogleMapStateBase>();
  final Set<Marker> markers = new Set();

  Future<void> requestLocationPermission() async {
    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;

    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    requestLocationPermission();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 5,
          backgroundColor: colorStaffWhite,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: colorStaffWhite,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                child: Container(
                  child: GoogleMap(
                    key: _key,
                    initialPosition: GeoCoord(10.9531641, 106.8017787),
                    initialZoom: 16,
                    mapType: MapType.terrain,
                    markers: markers,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: colorAllStaff,
                            border:
                                Border.all(width: 2, color: colorStaffWhite),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.keyboard_arrow_left_outlined,
                              size: 30, color: colorStaffWhite),
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        child: FittedBox(
                          child: Text(
                            '22h:15p (SAO - 06/11/2021)',
                            style: TextStyle(
                                fontSize: 20,
                                color: colorAllStaff,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: colorStaffWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.1,

                            /// Uu tien
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  child: Expanded(
                                    child: Container(
                                      width: 100,
                                      alignment: Alignment.topRight,
                                      child: Action(
                                        color: Colors.blue,
                                        text: 'Ưu tiên',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                //Thong tin
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nguyễn Long Bá',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)),
                                        Text('0382292563'),
                                        Row(
                                          children: [
                                            FittedBox(
                                              child: Text('Số vé: 2',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  )),
                                            ),
                                            SizedBox(width: 15),
                                            FittedBox(
                                              child: Text(
                                                'Thanh toán: chưa',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                maxLines: null,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.1,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Action(
                                        text: 'Đã vượt',
                                        color: Colors.red,
                                      ),
                                      Action(
                                        text: 'Ưu tiên',
                                        color: Colors.yellow,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 100),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: colorAllStaff,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Liên hệ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: colorStaffWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}

class Action extends StatelessWidget {
  final _actionDot = 15.0;
  final Color color;
  final String text;
  const Action({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: _actionDot,
          width: _actionDot,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
