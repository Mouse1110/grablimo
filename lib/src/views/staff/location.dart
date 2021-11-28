import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/controller/staff/staff.dart';
import 'package:flutter_my_train/src/model/otd/book.dart';
import 'package:flutter_my_train/src/model/staff.dart';
import 'package:flutter_my_train/src/utils/colors.dart';
import 'package:flutter_my_train/src/utils/icons.dart';
import 'package:flutter_my_train/src/views/staff/map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StaffLocation extends StatefulWidget {
  const StaffLocation({Key key}) : super(key: key);

  @override
  _StaffLocationState createState() => _StaffLocationState();
}

class _StaffLocationState extends State<StaffLocation> {
  List<String> phantu = ['a', 'b', 'c', 'd'];
  double _posTop;
  int _init = 0;
  @override
  Widget build(BuildContext context) {
    if (_init == 0) {
      _posTop = MediaQuery.of(context).size.height;
    } else if (_init == 1) {
      _posTop = 0;
    }
    return Consumer<StaffModel>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: colorAllStaff,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorAllStaff,
                    border: Border.all(width: 2, color: colorStaffWhite),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    '<',
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ),
              ),
              centerTitle: true,
              title: Text(
                '06/11/2020',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 1,
                ),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: colorAllStaff,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 2,
                        indent: 40,
                        endIndent: 40,
                        color: colorStaffWhite,
                      ),
                      // Điểm đoán và trả
                      Container(
                        height: 60,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _init = 1;
                                setState(() {});
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Container(
                                  child: TabButton(
                                    title: 'Điểm đón',
                                    selected: true,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: Container(
                                child: TabButton(
                                  title: 'Điểm trả',
                                  selected: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Location
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: colorStaffWhite,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 2000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                top: _posTop,
                                child: Column(
                                  children: [
                                    // Bus Icon
                                    SizedBox(height: 10),
                                    _buildBusIcon(),
                                    SizedBox(height: 10),
                                    // Location thong tin
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: value.listBook.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              if (index == 0)
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              TimeLineDot(
                                                data: value.listBook[index],
                                                index: index,
                                              ),
                                              if (index == phantu.length - 1)
                                                const SizedBox(
                                                  height: 100,
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StaffMap(),
                            ));
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                            child: Text('Xem trên bản đồ',
                                style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: colorStaffWhite))),
                        decoration: BoxDecoration(
                            color: colorAllStaff.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBusIcon() => SizedBox(
        child: Container(
          height: 60,
          width: 60,
          child: Image.asset(iconBus),
        ),
      );
}

class TabButton extends StatelessWidget {
  final String title;
  final bool selected;
  TabButton({Key key, this.title, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorStaffWhite),
        ),
        if (selected) Container(height: 7, width: 40, color: colorStaffWhite)
      ],
    );
  }
}

// ============================= Time line dot =============================
// class TimeLineDot extends StatelessWidget {
//   const TimeLineDot({ Key key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
class TimeLineDot extends StatefulWidget {
  final int index;
  final BookOTD data;
  TimeLineDot({Key key, this.index, this.data}) : super(key: key);

  @override
  _TimeLineDotState createState() => _TimeLineDotState();
}

class _TimeLineDotState extends State<TimeLineDot> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: (widget.index % 2 == 0)
          ? Row(
              children: [
                SizedBox(
                  width: size.width * 0.48,
                  child: Container(),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.015),
// thanh duong di
                            Container(
                              height: double.infinity,
                              width: size.width * 0.01,
                              color: colorAllStaff,
                            ),
                            Container(
                              height: 2,
                              width: size.width * 0.05,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: colorStaffWhite,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                      ),
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: Offset(0, -4),
                                        blurRadius: 4,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   '1 A, Huynh Van Nghe, Biên Hòa, Đồng Nai',
                                    //   style: GoogleFonts.nunito(
                                    //       fontSize: 12,
                                    //       color: Colors.black.withOpacity(0.7),
                                    //       fontStyle: FontStyle.italic),
                                    // ),
                                    Text(widget.data.name,
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        )),
                                    Text(widget.data.phone),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Thời gian',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            ),
                                            Text('17:00',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Còn lại',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            ),
                                            Text(widget.data.time,
                                                style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Liên hệ >>',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
// Positione time line dot
                        Positioned(
                            top: 0,
                            left: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.04,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  )),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: colorStaffWhite,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                      ),
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: Offset(0, -4),
                                        blurRadius: 4,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   '1 A, Huynh Van Nghe, Biên Hòa, Đồng Nai',
                                    //   style: GoogleFonts.nunito(
                                    //       fontSize: 12,
                                    //       color: Colors.black.withOpacity(0.7),
                                    //       fontStyle: FontStyle.italic),
                                    // ),
                                    Text(widget.data.name,
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        )),
                                    Text(widget.data.phone),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Thời gian',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            ),
                                            Text('17:00',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Còn lại',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 10,
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            ),
                                            Text('18h30',
                                                style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'Liên hệ >>',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              width: size.width * 0.05,
                              color: Colors.black,
                            ),
                            Container(
                              height: double.infinity,
                              width: size.width * 0.01,
                              color: colorAllStaff,
                            ),
                            SizedBox(width: size.width * 0.015),
                          ],
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.04,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  )),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.48,
                ),
              ],
            ),
    );
  }
}
