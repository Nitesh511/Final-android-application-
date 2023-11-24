// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:electronic_accessories_app/model/user.dart';
import 'package:electronic_accessories_app/repository/userrepository.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _registerUser(User user) async {
    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin) {
      // ignore: use_build_context_synchronously
      MotionToast.success(
        description: const Text("User added successfully"),
      ).show(context);
    } else {
      // ignore: use_build_context_synchronously
      MotionToast.error(
        description: Text("Error ${e.toString()}"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/back.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 89,
                ),
                Center(
                  child: Image.asset(
                    'assets/shopwisely.PNG',
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                TextFormField(
                  key: const ValueKey("username"),
                  controller: _usernameController,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "SFUIText",
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: const Color.fromARGB(211, 70, 69, 69),
                      filled: true,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: "SFUIText",
                      ),
                      labelText: "UserName",
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  key: const ValueKey("email"),
                  controller: _emailController,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "SFUIText",
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: const Color.fromARGB(211, 70, 69, 69),
                      filled: true,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: "SFUIText",
                      ),
                      labelText: "Email",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  key: const ValueKey("password"),
                  controller: _passwordController,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "SFUIText",
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: const Color.fromARGB(211, 70, 69, 69),
                      filled: true,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: "SFUIText",
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    key: const ValueKey("register"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        User user = User(
                          email: _emailController.text,
                          name: _usernameController.text,
                          password: _passwordController.text,
                        );
                        _registerUser(user);
                        // }
                      }
                    },
                    color: const Color.fromARGB(255, 27, 27, 66),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "SFUIText",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: "SFUIText",
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/');
                //   },
                //   child: const Text(
                //     "Back To Login",
                //     style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.white,
                //       fontFamily: "SFUIText",
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    color: const Color.fromARGB(255, 70, 209, 110),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Back To Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "SFUIText",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
