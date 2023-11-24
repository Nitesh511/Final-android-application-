import 'dart:io';

import 'package:electronic_accessories_app/repository/userrepository.dart';
import 'package:electronic_accessories_app/screens/profile_screens/app.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';

class EditImagePage extends StatefulWidget {
  const EditImagePage(String? photo, {Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  // var user = UserData.myUser;
  _registerUser(datatype, data) async {
    // bool isLogin =  await UserAPI.updateUserProfile(avishek,email);
    bool isLogin = await UserRepository().updateuserprofile(datatype, data);
    if (isLogin) {
      // ignore: use_build_context_synchronously
      //  MotionToast.success(
      //   description: const Text("User added successfully"),
      // ).show(context);
    } else {
      // ignore: use_build_context_synchronously
      // MotionToast.error(
      //   description: Text("Error ${e.toString()}"),
      // ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
              width: 330,
              child: Text(
                "Upload a photo of yourself:",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: 330,
                  child: GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (image == null) return;

                      final location = await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${location.path}/$name');
                      final newImage =
                          await File(image.path).copy(imageFile.path);
                      // setState(
                      //     () => user = user.copy(imagePath: newImage.path));
                      _registerUser("photo", newImage.path);
                    },
                    // child: Image.network(user.image),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        //  _registerUser("photo",imageFile);
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
