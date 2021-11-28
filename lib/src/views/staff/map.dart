import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_my_train/src/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class StaffMap extends StatefulWidget {
  const StaffMap({Key key}) : super(key: key);

  @override
  _StaffMapState createState() => _StaffMapState();
}

class _StaffMapState extends State<StaffMap> {
  GlobalKey<GoogleMapStateBase> _key = GlobalKey<GoogleMapStateBase>();
  final Set<Marker> markers = new Set();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
              children: [
                Container(
                  child: GoogleMap(
                    key: _key,
                    initialPosition: GeoCoord(13.2017752, 108.7849571),
                    mobilePreferences: const MobileMapPreferences(
                      myLocationEnabled: true,
                      trafficEnabled: true,
                      zoomControlsEnabled: false,
                    ),
                    webPreferences: WebMapPreferences(
                      fullscreenControl: true,
                      zoomControl: true,
                    ),
                    initialZoom: 10,
                    mapType: MapType.roadmap,
                    markers: markers,
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
                                  fontSize: 18,
                                  color: colorAllStaff,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 220,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: colorStaffWhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Ưu tiên',
                                    style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nguyễn Long Bá',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '0382292563',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Số vé: '),
                                        Text('2'),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      children: [
                                        Text('Thanh toán: '),
                                        Text('chưa'),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        )),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Đã vượt',
                                      style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.yellow,
                                        )),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Ưu tiên',
                                      style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 110,
                              decoration: BoxDecoration(
                                color: colorAllStaff,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Liên hệ',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
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
