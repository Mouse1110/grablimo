import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_my_train/src/controller/booking/booking.dart';
import 'package:flutter_my_train/src/model/otd/book.dart';
import 'package:flutter_my_train/src/utils/push.dart';
import 'package:flutter_my_train/src/views/book/position.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class BookLocation extends StatefulWidget {
  const BookLocation({Key key, this.diemDen, this.diemDi}) : super(key: key);
  final String diemDi;
  final String diemDen;
  @override
  State<BookLocation> createState() => _BookLocationState();
}

class _BookLocationState extends State<BookLocation> {
  TextEditingController _diemDi = TextEditingController();
  TextEditingController _diemDen = TextEditingController();
  double _posBottom;
  double _posMap;
  int _init = 0;
  List<String> diemDi = [];
  List<String> diemDen = [];
  DateTime date = DateTime.now();
  String time = '00:00';
  BookingController _controller;

  GlobalKey<GoogleMapStateBase> _key = GlobalKey<GoogleMapStateBase>();
  Set<Marker> _markers = Set();

  Widget location({
    Color color,
    String title,
    TextEditingController controller,
    String hint,
    Function press,
  }) =>
      Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration:
                          BoxDecoration(color: color, shape: BoxShape.circle),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.nunito(
                          fontSize: 10, color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: TextField(
                      style: GoogleFonts.nunito(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(hintText: hint),
                      controller: controller,
                    ))
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              press();
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Image.asset(
                  'assets/location.png',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          )
        ],
      );

  Widget cardLocation() => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, -4),
                  blurRadius: 4)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            location(
              color: Color.fromRGBO(22, 191, 28, 1),
              title: 'Điểm đi',
              hint: 'Nhập điểm đi',
              controller: _diemDi,
              press: () {
                setState(() {
                  _init = 2;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                height: 10,
                thickness: 1.5,
                color: Colors.black,
              ),
            ),
            location(
              color: Color.fromRGBO(0, 87, 255, 1),
              title: 'điểm đến',
              hint: 'Nhập điểm đến',
              controller: _diemDen,
              press: () {
                setState(() {
                  _init = 3;
                });
              },
            ),
          ],
        ),
      );

  Widget book() => Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          cardLocation(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2022, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (d) {
                        setState(() {
                          date = d;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.vi);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/calendar.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${date.day}-${date.month}-${date.year}',
                            style: GoogleFonts.nunito(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay t = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    setState(() {
                      time = '${t.hour}:${t.minute}';
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/calendar.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          time,
                          style: GoogleFonts.nunito(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (_diemDen.text != '' && _diemDi.text != '') {
                      setState(() {
                        _init = 1;
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'ĐẶT',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(246, 123, 70, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget rowCardTrain(
          {String title1, String text1, String title2, String text2}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Text(
                text1,
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title2,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Text(
                text2,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      );

  Widget card({
    String dateStart,
    String dateEnd,
    String kind,
    Function press,
  }) =>
      Container(
        height: 220,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 4),
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, -4),
                  blurRadius: 4),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            rowCardTrain(
                title1: 'Hãng xe',
                text1: 'SAO',
                title2: 'Dự kiến thời gian tới bến',
                text2: dateEnd),
            rowCardTrain(
                title1: 'Tuyến đường',
                text1: 'Sài gòn - Hà Nội',
                title2: 'Loại xe',
                text2: kind),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ngày khởi hành',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      dateStart,
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    press();
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 152, 94, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 152, 94, 1),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/ticket.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Mua vé',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );

  Widget scaffold({Size size, BuildContext context}) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(255, 152, 94, 1),
            leading: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '<',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            color: const Color.fromRGBO(255, 152, 94, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                book(),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceOut,
                            top: _posBottom,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  card(
                                    dateStart:
                                        '${date.day}-${date.month}-${date.year}-17:00',
                                    dateEnd:
                                        '${date.day + 1}-${date.month}-${date.year}',
                                    kind: 'Thường',
                                    press: () {
                                      BookOTD bookOTD = BookOTD();
                                      bookOTD.date =
                                          '${date.day}-${date.month}-${date.year}';
                                      bookOTD.diemDi = diemDi;
                                      bookOTD.diemDen = diemDen;
                                      bookOTD.time = time;
                                      bookOTD.kind = 'Thường';
                                      _controller.addLocation(bookOTD);
                                      Push.nextClientSave(
                                        context: context,
                                        page: BookPosition(),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  card(
                                    dateStart:
                                        '${date.day}-${date.month}-${date.year}-17:00',
                                    dateEnd:
                                        '${date.day + 1}-${date.month}-${date.year}',
                                    kind: 'Vip',
                                    press: () {
                                      BookOTD bookOTD = BookOTD();
                                      bookOTD.date =
                                          '${date.day}-${date.month}-${date.year}';
                                      bookOTD.diemDi = diemDi;
                                      bookOTD.diemDen = diemDen;
                                      bookOTD.time = time;
                                      bookOTD.kind = 'Vip';
                                      _controller.addLocation(bookOTD);
                                      Push.nextClientSave(
                                        context: context,
                                        page: BookPosition(),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceOut,
                            top: _posMap,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: _init > 1
                                ? Container(
                                    child: GoogleMap(
                                      key: _key,
                                      initialPosition:
                                          GeoCoord(10.9531641, 106.8017787),
                                      initialZoom: 16,
                                      mapType: MapType.terrain,
                                      onTap: (GeoCoord pos) {
                                        if (_init == 2) {
                                          _diemDi.text =
                                              '${pos.latitude},${pos.longitude}';
                                          diemDi.add('${pos.latitude}');
                                          diemDi.add('${pos.longitude}');
                                        } else {
                                          _diemDen.text =
                                              '${pos.latitude},${pos.longitude}';
                                          diemDen.add('${pos.latitude}');
                                          diemDen.add('${pos.longitude}');
                                        }
                                        GoogleMap.of(_key).clearMarkers();
                                        GoogleMap.of(_key).addMarkerRaw(pos,
                                            label: 'Điểm đi');
                                        _init = 0;
                                        setState(() {});
                                      },
                                      markers: Set<Marker>.of(_markers),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      ))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _diemDen.text = widget.diemDen;
    _diemDi.text = widget.diemDi;
    _controller = BookingController(context: context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _diemDen.dispose();
    _diemDi.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_init == 0) {
      _posBottom = size.height * 0.6;
      _posMap = size.height * 0.6;
    } else if (_init == 1) {
      _posBottom = 0;
    } else if (_init == 2) {
      _posMap = 0;
    } else if (_init == 3) {
      _posMap = 0;
    }
    return scaffold(size: size, context: context);
  }
}
