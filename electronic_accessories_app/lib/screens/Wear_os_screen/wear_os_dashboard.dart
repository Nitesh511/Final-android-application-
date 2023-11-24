// import 'dart:async';

// import 'package:electronic_accessories_app/api/user_api.dart';

// import 'package:electronic_accessories_app/model/profile_model.dart';
// import 'package:electronic_accessories_app/screens/profile_screens/edit_email.dart';
// import 'package:electronic_accessories_app/screens/profile_screens/edit_name.dart';

// import 'package:flutter/material.dart';

// // This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
// class ProfilesPages extends StatefulWidget {
//   @override
//   _ProfilePagesState createState() => _ProfilePagesState();
// }

// class _ProfilePagesState extends State<ProfilesPages> {
//   late Future<ResponseUserProfile?> futuredata;
//   @override
//   void initState() {
//     super.initState();
//     futuredata = UserAPI().getUserProfile();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FutureBuilder<ResponseUserProfile?>(
//           future: UserAPI().getUserProfile(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               if (snapshot.hasData) {
//                 // ProductResponse productResponse = snapshot.data!;
//                 ResponseUserProfile? lstProductCategory = snapshot.data;
//                 return SingleChildScrollView(
//                     child: SizedBox(
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height * 0.8,
//                   child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 1,
//                         crossAxisSpacing: 5.0,
//                         mainAxisSpacing: 5.0,
//                       ),
//                       itemCount: snapshot.data!.q.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             AppBar(
//                               backgroundColor: Colors.transparent,
//                               elevation: 0,
//                               toolbarHeight: 10,
//                             ),
//                             const SingleChildScrollView(
//                               child: Padding(
//                                 padding: EdgeInsets.only(bottom: 0),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // navigateSecondPage(EditImagePage(lstProductCategory!.data[0].photo));
//                               },
//                               child: Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.25,
//                                 width: MediaQuery.of(context).size.width * 0.80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.transparent,
//                                   image: const DecorationImage(
//                                     image: NetworkImage(
//                                         "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             buildUserInfoDisplay(lstProductCategory?.q[0].name,
//                                 'Name', const EditNameFormPage()),
//                             // buildUserInfoDisplay(user.phone, 'Phone', const EditPhoneFormPage()),
//                             buildUserInfoDisplay(lstProductCategory?.q[0].email,
//                                 'Email', const EditEmailFormPage()),
//                             // buildUserInfoDisplay(lstProductCategory?.q[0].role,
//                             //     'Role', const EditEmailFormPage()),
//                             // Expanded(
//                             //   flex: 2,
//                             //   child: buildAbout(lstProductCategory),
//                             // )
//                           ],
//                         );
//                       }),
//                 ));
//               } else {
//                 return const Center(
//                   child: Text("No data"),
//                 );
//               }
//             } else if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildUserInfoDisplay(first, String title, Widget editPage) => Padding(
//       padding: const EdgeInsets.only(bottom: 1),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 10,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 49, 183, 105),
//             ),
//           ),
//           Container(
//               width: double.infinity,
//               height: 37,
//               decoration: const BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(
//                 color: Colors.grey,
//                 width: 1,
//               ))),
//               child: Row(children: [
//                 Expanded(
//                     child: TextButton(
//                         onPressed: () {
//                           navigateSecondPage(editPage);
//                         },
//                         child: Text(
//                           first.toString(),
//                           style: const TextStyle(fontSize: 16, height: 1.4),
//                         ))),
//                 const Icon(
//                   Icons.keyboard_arrow_right,
//                   color: Colors.grey,
//                   size: 20.0,
//                 )
//               ]))
//         ],
//       ));

//   // // Refrshes the Page after updating user info.
//   FutureOr onGoBack(dynamic value) {
//     setState(() {});
//   }

//   // // Handles navigation and prompts refresh.
//   void navigateSecondPage(Widget editForm) {
//     Route route = MaterialPageRoute(builder: (context) => editForm);
//     Navigator.push(context, route).then(onGoBack);
//   }

//   // Widget builds the display item with the proper formatting to display the user's info

// }
