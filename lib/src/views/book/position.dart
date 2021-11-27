import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookPosition extends StatelessWidget {
  const BookPosition({Key key}) : super(key: key);

  Widget contaiPos({Color color, String title}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title,
              style: GoogleFonts.nunito(
                  fontSize: 12, color: Colors.black.withOpacity(0.7))),
        ],
      );

  Widget logPos({Size size}) => Container(
        height: size.height * 0.25,
        color: const Color.fromRGBO(255, 152, 94, 1),
        child: Stack(
          children: [
            Container(
              height: size.height * 0.15,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(255, 152, 94, 1),
                        )),
                    child: Text(
                      '<',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Chọn vị trí',
                    style: GoogleFonts.nunito(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 152, 94, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
            ),
            Positioned(
                top: size.height * 0.1,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 0.5,
                        color: Colors.black.withOpacity(0.25),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, 4),
                            blurRadius: 4)
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      contaiPos(
                          color: Color.fromRGBO(32, 215, 39, 1),
                          title: 'Còn trống'),
                      contaiPos(
                          color: Color.fromRGBO(88, 145, 255, 1),
                          title: 'Đã có người đặt'),
                      contaiPos(
                          color: Color.fromRGBO(255, 227, 80, 1),
                          title: 'Đang chọn'),
                      contaiPos(
                          color: Color.fromRGBO(255, 74, 74, 1),
                          title: 'Cấm đặt'),
                    ],
                  ),
                ))
          ],
        ),
      );
  Widget pos({Color color, String title}) => Container(
      width: 32,
      height: 32,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Center(
          child: Text(title,
              style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white))));
  Widget scaffold({Size size}) => SafeArea(
          child: Scaffold(
        body: Container(
          color: const Color.fromRGBO(255, 152, 94, 1),
          child: Column(
            children: [
              logPos(size: size),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0, 4),
                              blurRadius: 0),
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0, -4),
                              blurRadius: 4),
                        ]),
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                pos(
                                    color: const Color.fromRGBO(32, 215, 39, 1),
                                    title: 'A1'),
                                pos(
                                    color: const Color.fromRGBO(32, 215, 39, 1),
                                    title: 'A1'),
                                pos(
                                    color: const Color.fromRGBO(32, 215, 39, 1),
                                    title: 'A1'),
                                pos(
                                    color: const Color.fromRGBO(32, 215, 39, 1),
                                    title: 'A1'),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, -4),
                          blurRadius: 4)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Giá vé',
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            Text(
                              '200.000đ',
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
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
                              '2',
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w700),
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
                            Text(
                              'Tổng tiền',
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            Text(
                              '400.000đ',
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Container(
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
                                      color:
                                          const Color.fromRGBO(255, 152, 94, 1),
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
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return scaffold(size: size);
  }
}
