import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/controller/booking/booking.dart';
import 'package:flutter_my_train/src/model/client.dart';
import 'package:flutter_my_train/src/utils/push.dart';
import 'package:flutter_my_train/src/views/book/location.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _diemDi = TextEditingController();
  TextEditingController _diemDen = TextEditingController();
  BookingController _bookingController;

  Widget location(
          {Color color,
          String title,
          TextEditingController controller,
          String hint}) =>
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
                  blurRadius: 4),
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 4),
                  blurRadius: 4)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            location(
                color: Color.fromRGBO(22, 191, 28, 1),
                title: 'Điểm đi',
                hint: 'Nhập điểm đi',
                controller: _diemDi),
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
                title: 'Điểm đến',
                hint: 'Nhập điểm đến',
                controller: _diemDen),
          ],
        ),
      );

  Widget cardTicket() => Consumer<ClientModel>(
        builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 250,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4),
                ]),
            child: value.bookIndex != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hãng xe',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                                Text(
                                  'SAO',
                                  style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Số vé',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                                Text(
                                  '${value.bookIndex.char.length}',
                                  style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ngày khởi hành',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                    Text(
                                      '${value.bookIndex.date}-17:00',
                                      style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Tổng tiền',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                    Text(
                                      '${value.bookIndex.char.length * 200}.000đ',
                                      style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 55,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 152, 94, 0.25),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24))),
                            child: Text(
                              'Xem thông tin vé',
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : Center(
                    child: Text(
                      'Hiện tại bạn chưa đặt vé nào',
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
          );
        },
      );

  Widget scaffold({BuildContext context}) => SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: double.infinity,
              color: Color.fromRGBO(244, 244, 244, 1),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Chào mừng, bạn đã đến với chúng tôi',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Icon(
                                LineIcons.user,
                                size: 40,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          cardLocation(),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Push.nextClientSave(
                                    context: context,
                                    page: BookLocation(
                                      diemDi: _diemDi.text,
                                      diemDen: _diemDen.text,
                                    ));
                              },
                              child: Container(
                                width: 150,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 152, 94, 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Đặt vé',
                                  style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          cardTicket(),
                          const SizedBox(
                            height: 150,
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
                        height: 90,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(90),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            offset: Offset(0, -4),
                                            blurRadius: 4),
                                      ]),
                                  child: Text('Đặt vé ngay với chúng tôi',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.5,
                                          color:
                                              Color.fromRGBO(0, 87, 255, 1))),
                                )),
                            Positioned(
                                top: 0,
                                left: 50,
                                child: GestureDetector(
                                  onTap: () {
                                    Push.nextClientSave(
                                        context: context, page: BookLocation());
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 152, 94, 1),
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                        'assets/ticket.png',
                                        width: 32,
                                        height: 32,
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ))
                ],
              ),
            )),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bookingController = BookingController(context: context);
    _bookingController
        .getBook(phone: _bookingController.model.user.phone)
        .then((value) {
      if (value != null) {
        _bookingController.model.changeBookIndex(value);
      }
    });
    _bookingController
        .getCurrent()
        .then((value) => _bookingController.model.changePosition(value));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _diemDen.dispose();
    _diemDi.dispose();
  }

  @override
  Widget build(BuildContext context) => scaffold(context: context);
}
