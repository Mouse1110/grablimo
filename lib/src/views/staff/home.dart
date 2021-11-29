import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/controller/staff/staff.dart';
import 'package:flutter_my_train/src/model/staff.dart';
import 'package:flutter_my_train/src/utils/colors.dart';
import 'package:flutter_my_train/src/utils/push.dart';
import 'package:flutter_my_train/src/views/staff/location.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StaffHome extends StatefulWidget {
  final int khachHang;
  final int hangHoa;
  final int thanhToanTruoc;
  const StaffHome({Key key, this.khachHang, this.hangHoa, this.thanhToanTruoc})
      : super(key: key);

  @override
  _StaffHomeState createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {
  // muon in ra thi ban phai truy cap vao tung phan tu =>  widget cha
  StaffController staffController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    staffController = StaffController(context: context);
    staffController.get().then((value) {
      if (value != null) {
        staffController.model.changeList(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            margin: EdgeInsets.only(top: 70),
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        'Chào mừng, bạn đã đến với chúng tôi',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: colorStaffWhite,
                            shape: BoxShape.circle,
                            border: Border.all(width: 1))),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          color: colorStaffWhite,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ]),
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Khách hàng',
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                    Text('${value.listBook.length}',
                                        style: GoogleFonts.nunito(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Hàng hoá',
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                    Text('0',
                                        style: GoogleFonts.nunito(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ngày khởi hành',
                                          style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                        ),
                                        Text(
                                            '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                                            style: GoogleFonts.nunito(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Thanh toán trước',
                                          style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                        ),
                                        Text('0',
                                            style: GoogleFonts.nunito(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  staffController.get().then((value) {
                                    if (value != null) {
                                      staffController.model.changeList(value);
                                      Push.nextStaff(
                                          context: context,
                                          page: StaffLocation());
                                    }
                                  });
                                },
                                child: Container(
                                  height: 55,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: colorAllStaff.withOpacity(0.25),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Text(
                                    'Khởi hành',
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
