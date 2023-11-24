import 'dart:math';

import 'package:electronic_accessories_app/repository/userrepository.dart';
import 'package:electronic_accessories_app/screens/profile_screens/app.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

// This class handles the Page to edit the Email Section of the User Profile.
class EditEmailFormPage extends StatefulWidget {
  const EditEmailFormPage({Key? key}) : super(key: key);

  @override
  EditEmailFormPageState createState() {
    return EditEmailFormPageState();
  }
}

class EditEmailFormPageState extends State<EditEmailFormPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  _registerUser(datatype, data) async {
    // bool isLogin =  await UserAPI.updateUserProfile(avishek,email);
    bool isLogin = await UserRepository().updateuserprofile(datatype, data);
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
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                      width: 320,
                      child: Text(
                        "What's your email?",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                          height: 100,
                          width: 320,
                          child: TextFormField(
                            // Handles Form Validation
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email.';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Your email address'),
                            controller: emailController,
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 320,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate() &&
                                    EmailValidator.validate(
                                        emailController.text)) {
                                  _registerUser("email", emailController.text);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )))
                ]),
          ),
        ));
  }
}
