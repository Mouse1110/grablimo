import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/controller/booking/booking.dart';
import 'package:flutter_my_train/src/model/client.dart';
import 'package:flutter_my_train/src/utils/push.dart';
import 'package:flutter_my_train/src/views/book/check.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookBill extends StatefulWidget {
  const BookBill({Key key}) : super(key: key);

  @override
  State<BookBill> createState() => _BookBillState();
}

class _BookBillState extends State<BookBill> {
  BookingController _controller;
  Widget scaffold() => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Thanh Toán',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
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
            body: Consumer<ClientModel>(
              builder: (context, value, child) {
                return Container(
                  color: const Color.fromRGBO(255, 152, 94, 1),
                  height: double.infinity,
                  child: Center(
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black.withOpacity(0.24),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 10)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hãng xe',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('SAO',
                                      style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Loại xe',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(value.book.kind,
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
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
                                  Text('Tuyến đường',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('Sài Gòn - Hà Nội',
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Số vé',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('${value.book.char.length}',
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
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
                                  Text('Ngày khởi hành',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('${value.book.date}-17:00',
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Tổng tiền',
                                      style: GoogleFonts.nunito(
                                          fontSize: 12,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('${value.book.char.length * 200}.000đ',
                                      style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Điểm đi',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.7))),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  '${value.book.diemDi[0]},${value.book.diemDi[1]}',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Điểm đến',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.7))),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  '${value.book.diemDen[0]},${value.book.diemDen[1]}',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                _controller
                                    .post(book: _controller.model.book)
                                    .then((value) => Push.nextClientSave(
                                        context: context, page: BookCheck()));
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
                                            color: const Color.fromRGBO(
                                                255, 152, 94, 1),
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
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = BookingController(context: context);
  }

  @override
  Widget build(BuildContext context) => scaffold();
}
