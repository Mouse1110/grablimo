import 'package:flutter/material.dart';
import 'package:flutter_my_train/src/controller/login/login.dart';
import 'package:flutter_my_train/src/model/otd/user.dart';
import 'package:flutter_my_train/src/utils/push.dart';
import 'package:flutter_my_train/src/views/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _pass = TextEditingController();
  LoginController _controller;
  Widget input({String title, String hint, TextEditingController controller}) =>
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
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.nunito(
                    fontSize: 12, color: Colors.black.withOpacity(0.7))),
          )
        ],
      );

  Widget scaffold({Size size, BuildContext context}) => SafeArea(
        child: Scaffold(
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
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Text(
                              '????ng K??',
                              style: GoogleFonts.nunito(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 64,
                                height: 64,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.7))),
                                child: Image.asset(
                                  'assets/camera.png',
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            input(
                              title: 'T??n c???a b???n',
                              hint: 'Nh???p h??? v?? t??n',
                              controller: _name,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            input(
                              title: 'S??? ??i???n tho???i',
                              hint: 'Nh???p s??? ??i???n tho???i',
                              controller: _phone,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            input(
                              title: 'M???t kh???u',
                              hint: 'Nh???p m???t kh???u c???a b???n',
                              controller: _pass,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Center(
                                            child: CircularProgressIndicator(
                                              color: Color.fromRGBO(
                                                  255, 152, 94, 1),
                                            ),
                                          ),
                                        );
                                      });
                                  UserOTD user = UserOTD(
                                    name: _name.text,
                                    phone: _phone.text,
                                    pass: _pass.text,
                                  );
                                  _controller.signup(user: user).then((value) {
                                    if (value != null) {
                                      _controller.model.changeUser(value);
                                      Push.nextClientSave(
                                          context: context, page: Home());
                                    }
                                  });
                                },
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(255, 152, 94, 1),
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Text(
                                    'X??c nh???n',
                                    style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 200,
                            ),
                          ],
                        ),
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
    _name.dispose();
    _phone.dispose();
    _pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return scaffold(size: size, context: context);
  }
}
