import 'package:flutter/material.dart';
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
          Container(
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
                title: 'Nhập điểm đến',
                controller: _diemDen),
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
                          '11/10/2000 - 20h30',
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
                Container(
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

  Widget scaffold() => SafeArea(
        child: Scaffold(
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
                      Container(
                        height: 220,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                text2: '11/11/2021-5h30'),
                            rowCardTrain(
                                title1: 'Tuyến đường',
                                text1: 'Sài gòn - Hà Nội',
                                title2: 'Loại xe',
                                text2: 'Thường'),
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
                                      '30/10/2021-20h30',
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 152, 94, 1),
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
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                )
                              ],
                            ),
                          ],
                        ),
                      )
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _diemDen.dispose();
    _diemDi.dispose();
  }

  @override
  Widget build(BuildContext context) => scaffold();
}
