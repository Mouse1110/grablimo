import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  Widget icon({String text, double size}) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border:
                Border.all(width: 0.3, color: Colors.black.withOpacity(0.3))),
        child: Center(
          child: text != null
              ? Text(
                  text,
                  style: GoogleFonts.nunito(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : SizedBox(),
        ),
      );

  Widget title({String title}) => Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      );

  Widget scaffold() => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 152, 94, 1),
            leading: const SizedBox(),
            title: Text(
              'GRABLIMO',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            actions: const [
              Icon(
                LineIcons.user,
                size: 32,
              )
            ],
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                color: const Color.fromRGBO(255, 152, 94, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text('22h:15p (SAO - 06/11/2021)',
                            style: GoogleFonts.nunito(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 64,
                            child: Stack(
                              children: [
                                Positioned(
                                  child: icon(size: 32),
                                ),
                                Positioned(
                                  left: 16,
                                  child: icon(size: 32),
                                ),
                                Positioned(
                                  left: 32,
                                  child: icon(text: '+0', size: 32),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Thắng, Bá ... đã kết nối với bạn',
                                style: GoogleFonts.nunito(fontSize: 16),
                              ),
                              Text(
                                'Các bạn có thể đặt vé chung',
                                style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    title(title: 'Vé'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 170,
                        height: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'SAO',
                                      style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '400.000đ',
                                          style: GoogleFonts.nunito(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 24,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: icon(size: 16),
                                      ),
                                      Positioned(
                                        left: 8,
                                        child: icon(size: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '30/10/2021',
                              style: GoogleFonts.nunito(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '16h00 -> 16h50',
                              style: GoogleFonts.nunito(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    title(title: 'Tin Tức'),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('Hiện tại không có tin tức nào'),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  LineIcons.home,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                Icon(
                                  LineIcons.user,
                                  color: Colors.black,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 4,
                                        color: Colors.black.withOpacity(0.5))
                                  ]),
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 152, 94, 1),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Image.asset(
                                    'assets/ticket.png',
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => scaffold();
}
