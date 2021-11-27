import 'package:flutter/material.dart';

import 'package:flutter_my_train/src/utils/colors.dart';

import 'location.dart';

class StaffHome extends StatelessWidget {
  const StaffHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5,
        backgroundColor: colorAllStaff,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: colorAllStaff,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
// Icon back
            Positioned(
              left: 20,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: colorStaffWhite),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.navigate_before,
                    size: 30, color: colorStaffWhite),
              ),
            ),
            Column(
              children: [
// Earth
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    shape: BoxShape.circle,
                  ),
                ),
                Divider(
                  height: 50,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                  color: colorStaffWhite,
                ),
// DD/MM/YYY
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.navigate_before,
                        size: 36,
                        color: colorStaffWhite,
                      ),
                      Spacer(),
                      FittedBox(
                        child: Text(
                          '06/11/2021',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: colorStaffWhite,
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        size: 36,
                        color: colorStaffWhite,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
// Two People and Ticke Details
                Container(
                  height: 80,
                  width: size.width * 0.9,
                  color: colorStaffWhite,
                  child: Row(
                    children: [
                      // Two People
                      Container(
                        width: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 30,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Ticke Details
                      Expanded(
                        child: Container(
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child: Text(
                                      'Thắng, Bá, Thắng, Bá, Thắng, Bá',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      'đã đặt vé',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                              FittedBox(
                                child: Text(
                                  'Bạn có muốn xem cụ thể >> ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
// Item Classification
                Expanded(
                  child: Container(
                    width: size.width * 0.9,
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildDataNumber('Khách hàng', 15, '>'),
                        ),
                        Expanded(
                          child: _buildDataNumber('Hàng hoá', 15, '>'),
                        ),
                        Expanded(
                          child: _buildDataNumber('Thanh toán trước', 15, ''),
                        ),
                      ],
                    ),
                  ),
                ),
// Start
                Container(
                  height: 60,
                  width: size.width * 0.9,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          height: 60,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: FittedBox(
                            child: Text(
                              '15h00' + ' -> ' + '15h30',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: colorStaffWhite),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StaffLocation(),
                                ));
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: colorStaffWhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              'Khởi hành',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataNumber(String title, int number, String kytu) => Container(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
              child: Text(title,
                  style: TextStyle(fontSize: 14, color: colorStaffWhite))),
          Container(
            width: 120,
            child: Row(
              children: [
                Text(
                  '$number',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colorStaffWhite),
                ),
                Spacer(),
                Text(
                  kytu,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colorStaffWhite),
                ),
              ],
            ),
          ),
        ],
      ));
}
