import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:electronic_accessories_app/screens/Home/mainHomepage.dart';
import 'package:electronic_accessories_app/screens/Wear_os_screen/wear_os_main.dart';
import 'package:electronic_accessories_app/screens/aboutus.dart';
import 'package:electronic_accessories_app/screens/bottomNavagationScreen.dart';
import 'package:electronic_accessories_app/screens/homeScren.dart';
import 'package:electronic_accessories_app/screens/login_scren.dart';
import 'package:electronic_accessories_app/screens/sign_up.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String API_BOX = "api_data";

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(API_BOX);
  AwesomeNotifications().initialize('resource://drawable/launcher', [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic test',
        defaultColor: const Color(0xFF9D50DD),
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true)
  ]);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/dashboard': (context) => const MyApp(),
        "/register": (context) => const RegisterScreen(),
        "/login": (context) => const LoginPage(),
        "/abouus": (context) => const MyWidget(),
        // '/main': (context) => const MainHomePage(),
        // "/": (context) => const Wearlogin()
      },
    ),
  );
}
