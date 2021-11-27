import 'package:flutter/material.dart';

import 'package:flutter_my_train/src/utils/colors.dart';
import 'package:flutter_my_train/src/utils/icons.dart';

import 'map.dart';

const _airbussize = 60.0;
const _dotSize = 26.0;

class StaffLocation extends StatefulWidget {
  const StaffLocation({Key key}) : super(key: key);

  @override
  _StaffLocationState createState() => _StaffLocationState();
}

class _StaffLocationState extends State<StaffLocation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> arr = ['a', 'b', 'c', 'd'];

    double pos = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 5,
        backgroundColor: colorAllStaff,
      ),
      body: Stack(
        children: [
          Positioned(
            height: size.height * 0.32,
            left: 0,
            right: 0,
            child: Container(
              color: colorAllStaff,
              child: Column(
                children: [
// DD/MM/YYYY
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('06/11/2021',
                        style: TextStyle(
                            fontSize: 30,
                            color: colorStaffWhite,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center),
                  ),
                  Divider(
                    height: 40,
                    thickness: 2,
                    indent: 40,
                    endIndent: 40,
                    color: colorStaffWhite,
                  ),
// Điểm đón và trả
                  Container(
                    height: 50,
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Expanded(
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
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Container(
                              child: TabButton(
                                title: 'Điểm trả',
                                selected: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
// Icon back
          Positioned(
            top: 5,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: colorStaffWhite),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.keyboard_arrow_left_outlined,
                    size: 30, color: colorStaffWhite),
              ),
            ),
          ),
// Container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.0,
            top: size.height * 0.36 / 2,
            child: Container(
              decoration: BoxDecoration(
                color: colorStaffWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final centerDot = constraints.maxWidth / 2 - _dotSize / 2;
                  return Stack(
                    children: [
                      Positioned(
                        left: constraints.maxWidth / 2 - _airbussize / 2,
                        top: 10,
                        bottom: 0.0,
                        child: BusTimeLine(),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0.0,
                        child: Container(
                          child: Stack(
                              children: arr.map((e) {
                            pos += 100;
                            return (pos / 100) % 2 != 1
                                ? Positioned(
                                    right: centerDot,
                                    top: pos,
                                    child: TimeLineDot(
                                      left: true,
                                    ),
                                  )
                                : Positioned(
                                    left: centerDot,
                                    top: pos,
                                    child: TimeLineDot(
                                      left: false,
                                    ),
                                  );
                          }).toList()),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color: colorAllStaff,
                                borderRadius: BorderRadius.circular(5)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StaffMap(),
                                    ));
                              },
                              child: Center(
                                child: Text('Xem trên bảng đồ',
                                    style: TextStyle(
                                        color: colorStaffWhite,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
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
          style: TextStyle(
              color: selected ? colorStaffWhite : colorStaffWhite,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        if (selected)
          Container(
            height: 5,
            width: 40,
            color: colorStaffWhite,
          )
      ],
    );
  }
}

/// xe buss
class BusTimeLine extends StatelessWidget {
  const BusTimeLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.asset(iconBus),
          ),
          Expanded(
              child: Container(
            width: 5,
            color: colorAllStaff,
          ))
        ],
      ),
    );
  }
}

class TimeLineDot extends StatelessWidget {
  final bool left;
  TimeLineDot({Key key, this.left}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if (left) ...[
        Container(
          height: 130,
          width: 165,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            color: colorStaffWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text('1 A, Huynh Van Nghe, Biên Hòa, Đồng Nai',
                    style: TextStyle(fontSize: 12)),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nguyễn Long Bá',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                    Text('0382292563', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Thơi gian', style: TextStyle(fontSize: 10)),
                        Text('18h30',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Còn lại', style: TextStyle(fontSize: 10)),
                        Text('3p',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  Container(
                      child: Text('Liên hệ >>', style: TextStyle(fontSize: 10)))
                ],
              )
            ],
          ),
        ),
        Container(
          width: 20,
          height: 2,
          color: Colors.black,
        ),
      ],
      Container(
        height: _dotSize,
        width: _dotSize,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      ),
      if (!left) ...[
        Container(
          width: 20,
          height: 2,
          color: Colors.black,
        ),
        Container(
          height: 130,
          width: 165,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            color: colorStaffWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text('1 A, Huynh Van Nghe, Biên Hòa, Đồng Nai',
                    style: TextStyle(fontSize: 12)),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nguyen Long Ba',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                    Text('0789429140', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Thoi gian', style: TextStyle(fontSize: 10)),
                        Text('18h30',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Con lai', style: TextStyle(fontSize: 10)),
                        Text('3p',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  Container(
                      child: Text('Lien he >>', style: TextStyle(fontSize: 10)))
                ],
              )
            ],
          ),
        ),
      ],
    ]);
  }
}
