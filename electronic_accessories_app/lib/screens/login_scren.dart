// ignore_for_file: deprecated_member_use

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:electronic_accessories_app/repository/userrepository.dart';
import 'package:electronic_accessories_app/screens/bottomNavagationScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _navigateToScreen(bool isLogin) async {
    if (isLogin) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? val = pref.getString("name");
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: counter,
              channelKey: 'basic_channel',
              title: 'Hello $val',
              body: 'Login Sucessfull'));
      setState(() {
        counter++;
      });
      // Get.to(() => const MyApp());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyApp()));
    } else {
      MotionToast.error(description: const Text('Enter user or passowrd'))
          .show(context);
    }
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");

    if (val != null) {
      // Navigator.push(
      //   context, MaterialPageRoute(builder : (context) => HomeScreen())
      // );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MyApp()),
          (route) => false);
    }
  }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();

      bool isLogin = await userRepository.login(
        _emailController.text,
        _passwordController.text,
      );

      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error:${e.toString()}"),
      ).show(context); // MotionToast.error

    }
  }

  int counter = 1;
  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
        AwesomeNotifications()
            .actionStream
            .listen((ReceivedNotification receivedNotification) {
          Navigator.of(context).pushNamed('/');
        });
      }
    });
  }

  @override
  void initState() {
    checkLogin();
    _checkNotificationEnabled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/back.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 91),
                      child: ClipPath(
                        clipper: ClipPath1(),
                        child: Container(
                          height: 276,
                          width: 176,
                          color: const Color.fromARGB(0, 27, 192, 198),
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: SizedBox(
                        height: 280,
                        width: 600,
                        child: Image.asset(
                          "assets/login.webp",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Welcome to ShopWisely",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                    Text(
                      "Please login to continue.",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 159, 213, 176)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: const ValueKey("email"),
                      controller: _emailController,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: const Color(0xffe0e0e0),
                      ),
                      decoration: InputDecoration(
                          hintText: "nitesh.karki31@gmai.com",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: const Color(0xffe0e0e0),
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle,
                            color: Color(0xffe0e0e0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xff1ab4f3),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color(0xff1ab4f3),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color(0xff1ab4f3),
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xff1ab4f3),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      key: const ValueKey("password"),
                      controller: _passwordController,
                      obscureText: true,
                      style: GoogleFonts.montserrat(
                        fontSize: 13.59,
                        color: const Color(0xffe0e0e0),
                      ),
                      decoration: InputDecoration(
                          hintText: "• • • • • • • • •",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: const Color(0xffe0e0e0),
                          ),
                          prefixIcon: const Icon(
                            Icons.key_off_outlined,
                            color: Color(0xffe0e0e0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xff1ab4f3),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color(0xff1ab4f3),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color(0xff1ab4f3),
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xff1ab4f3),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                        key: const ValueKey("login"),
                        onPressed: () {
                          _login();

                          // Navigator.pushNamed(context, '/homepage');
                        },
                        color: const Color(0xff1bbfc6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: Text(
                          "SIGN IN",
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: RichText(
                            text: TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                                children: [
                              TextSpan(
                                  text: "Create one.",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green))
                            ])),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var oneThirdHeight = size.height / 3;

    final path = Path()
      ..lineTo(0, oneThirdHeight)
      ..lineTo(0, oneThirdHeight * 2)
      ..quadraticBezierTo(0, (oneThirdHeight * 2) + 37, 20, size.width + 57)
      ..lineTo(size.width / 2, size.height)
      ..quadraticBezierTo(size.width + 30, (oneThirdHeight * 2) + 37,
          size.width - 10, oneThirdHeight * 2)
      ..lineTo(size.width, (oneThirdHeight * 2) + 25)
      ..lineTo(size.width, oneThirdHeight - 20)
      ..quadraticBezierTo(size.width, oneThirdHeight - 35, size.height / 2 + 20,
          size.width / 2 - 40)
      ..lineTo(size.width / 2, 0)
      ..quadraticBezierTo(0, oneThirdHeight - 40, 0, oneThirdHeight - 30)
      ..lineTo(0, oneThirdHeight)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
