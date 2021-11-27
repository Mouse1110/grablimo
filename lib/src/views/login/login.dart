import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  Widget input({String title, String hint}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.nunito(
                    fontSize: 14, color: Colors.black.withOpacity(0.7))),
          )
        ],
      );

  Widget scaffold({Size size}) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 152, 94, 1),
            elevation: 0,
          ),
          body: Container(
            height: double.infinity,
            color: const Color.fromRGBO(255, 152, 94, 1),
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: size.height * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(90))),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Đăng Nhập',
                            style: GoogleFonts.nunito(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    input(
                                        title: 'Số điện thoại',
                                        hint: 'Nhập số điện thoại'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    input(
                                        title: 'Mật khẩu',
                                        hint: 'Nhập mật khẩu của bạn'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Quên mật khẩu ?',
                                        style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                      ),
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                255, 152, 94, 1),
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: Text(
                                          'Xác nhận',
                                          style: GoogleFonts.nunito(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Bạn chưa có tài khoản?',
                                            style: GoogleFonts.nunito(
                                                fontSize: 16,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Đăng ký',
                                            style: GoogleFonts.nunito(
                                                fontSize: 16,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: 0,
                    left: 20,
                    child: Image.asset(
                      'assets/bus.png',
                      width: 128,
                      height: 128,
                    )),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return scaffold(size: size);
  }
}
