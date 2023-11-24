import 'dart:math';

import 'package:electronic_accessories_app/repository/userrepository.dart';
import 'package:electronic_accessories_app/screens/profile_screens/app.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:string_validator/string_validator.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);
  // const EditNameFormPage(User data, {Key? key}) : super(key: key);
  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  _registerUser(datatype, data) async {
    // bool isLogin =  await UserAPI.updateUserProfile(avishek,email);
    bool isLogin = await UserRepository().updateuserprofile(datatype, data);
    if (isLogin) {
      // ignore: use_build_context_synchronously
      MotionToast.success(
        description: const Text(
          "User Updated  successfully",
          style: TextStyle(fontSize: 10),
        ),
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
                    width: 330,
                    child: Text(
                      "What's Your Name?",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                        child: SizedBox(
                            height: 100,
                            width: 150,
                            child: TextFormField(
                              // Handles Form Validation for First Name
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                } else if (!isAlpha(value)) {
                                  return 'Only Letters Please';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'First Name'),
                              controller: firstNameController,
                            ))),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 330,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                _registerUser("name", firstNameController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ],
            ),
          ),
        ));
  }
}
