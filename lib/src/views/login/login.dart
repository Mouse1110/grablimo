import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/controller/login/login.dart';

import 'package:flutter_my_train/src/utils/push.dart';
import 'package:flutter_my_train/src/views/home/home.dart';
import 'package:flutter_my_train/src/views/login/signup.dart';
import 'package:flutter_my_train/src/views/staff/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _nameInput = TextEditingController();
  TextEditingController _passInput = TextEditingController();

  LoginController _controller;

  Widget input(
          {TextEditingController controller,
          String title,
          String hint,
          bool pass}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          TextField(
            controller: controller,
            obscureText: pass,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.nunito(
                    fontSize: 12, color: Colors.black.withOpacity(0.7))),
          )
        ],
      );

  Widget scaffold({Size size, BuildContext context}) => SafeArea(
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
                                fontSize: 24, fontWeight: FontWeight.bold),
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
                                        pass: false,
                                        controller: _nameInput,
                                        title: 'Số điện thoại',
                                        hint: 'Nhập số điện thoại'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    input(
                                        pass: true,
                                        controller: _passInput,
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
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.7)),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Color.fromRGBO(
                                                          255, 152, 94, 1),
                                                    ),
                                                  ),
                                                );
                                              });
                                          _controller
                                              .login(
                                            phone: _nameInput.text,
                                            pass: _passInput.text,
                                          )
                                              .then((value) {
                                            if (value != null) {
                                              print(value);
                                              if (value == true) {
                                                Push.nextStaff(
                                                    context: context,
                                                    page: StaffHome());
                                              } else {
                                                _controller.model
                                                    .changeUser(value);
                                                Push.nextClientSave(
                                                    context: context,
                                                    page: Home());
                                              }
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 200,
                                          height: 50,
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
                                                fontSize: 14,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Push.nextClientSave(
                                                  context: context,
                                                  page: SignUp());
                                            },
                                            child: Text(
                                              'Đăng ký',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w700),
                                            ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = LoginController(context: context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameInput.dispose();
    _passInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return scaffold(size: size, context: context);
  }
}
