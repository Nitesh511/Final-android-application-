import 'dart:async';

import 'package:electronic_accessories_app/api/user_api.dart';
import 'package:electronic_accessories_app/model/images.dart';
import 'package:electronic_accessories_app/model/profile_model.dart';
import 'package:electronic_accessories_app/screens/profile_screens/edit_description.dart';
import 'package:electronic_accessories_app/screens/profile_screens/edit_email.dart';
import 'package:electronic_accessories_app/screens/profile_screens/edit_name.dart';
import 'package:flutter/material.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<ResponseUserProfile?> futuredata;
  @override
  void initState() {
    super.initState();
    futuredata = UserAPI().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<ResponseUserProfile?>(
          future: UserAPI().getUserProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // ProductResponse productResponse = snapshot.data!;
                ResponseUserProfile? lstProductCategory = snapshot.data;
                return SingleChildScrollView(
                    child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: snapshot.data!.q.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              toolbarHeight: 10,
                            ),
                            const SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 1),
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(64, 105, 225, 1),
                                    ),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                // navigateSecondPage(EditImagePage(lstProductCategory!.data[0].photo));
                              },
                              child: Expanded(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.19,
                                  width:
                                      MediaQuery.of(context).size.width * 0.99,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.transparent,
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            buildUserInfoDisplay(lstProductCategory?.q[0].name,
                                'Name', const EditNameFormPage()),
                            // buildUserInfoDisplay(user.phone, 'Phone', const EditPhoneFormPage()),
                            buildUserInfoDisplay(lstProductCategory?.q[0].email,
                                'Email', const EditEmailFormPage()),
                            buildUserInfoDisplay(lstProductCategory?.q[0].role,
                                'Role', const EditEmailFormPage()),
                            // Expanded(
                            //   flex: 2,
                            //   child: buildAbout(lstProductCategory),
                            // )
                          ],
                        );
                      }),
                ));
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildUserInfoDisplay(first, String title, Widget editPage) => Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(editPage);
                        },
                        child: Text(
                          first.toString(),
                          style: const TextStyle(fontSize: 16, height: 1.4),
                        ))),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // // Widget builds the About Me Section
  Widget buildAbout(ResponseUserProfile user) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(EditDescriptionFormPage());
                        },
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Hello",
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                  ),
                                ))))),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }

  // Widget builds the display item with the proper formatting to display the user's info

}
