// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:electronic_accessories_app/repository/userrepository.dart';
// import 'package:electronic_accessories_app/screens/Wear_os_screen/wear_os_dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:wear/wear.dart';

// class Wearlogin extends StatefulWidget {
//   const Wearlogin({Key? key}) : super(key: key);
//   @override
//   State<Wearlogin> createState() => _WearloginState();
// }

// class _WearloginState extends State<Wearlogin> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   int counter = 1;
//   _checkNotificationEnabled() {
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//   }

//   @override
//   void initState() {
//     _checkNotificationEnabled();
//     super.initState();
//   }

//   _navigateToScreen(bool isLogin) {
//     if (isLogin) {
//       AwesomeNotifications().createNotification(
//           content: NotificationContent(
//               id: counter,
//               channelKey: 'basic_channel',
//               title: 'Notification_title',
//               body: 'Login Sucesfully'));
//       setState(() {
//         counter++;
//       });
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => ProfilesPages()));
//     } else {
//       Fluttertoast.showToast(
//           msg: 'Username or password incorrect',
//           backgroundColor: const Color.fromARGB(255, 221, 30, 30),
//           fontSize: 13); // MotionToast.error
//     }
//   }

//   _login() async {
//     try {
//       UserRepository userRepository = UserRepository();
//       bool isLogin = await userRepository.login(
//         _emailController.text,
//         _passwordController.text,
//       );
//       if (isLogin) {
//         _navigateToScreen(true);
//       } else {
//         _navigateToScreen(false);
//       }
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: 'Username or password incorrect',
//         backgroundColor: Colors.grey,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WatchShape(
//       builder: (BuildContext context, WearShape shape, Widget? child) {
//         return AmbientMode(
//           builder: (context, mode, child) {
//             return Scaffold(
//               body: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Form(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: const InputDecoration(
//                           labelText: "email",
//                           hintText: "Email",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "The input box is empty";
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 4,
//                       ),
//                       TextFormField(
//                         controller: _passwordController,
//                         decoration: const InputDecoration(
//                           labelText: "password",
//                           hintText: "password",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "The input box is empty";
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       SizedBox(
//                         width: 10,
//                         height: 20,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               _login();
//                             });
//                           },
//                           child: const Text(
//                             "Login",
//                             style: TextStyle(
//                               color: Color.fromARGB(172, 236, 11, 11),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
