import 'package:electronic_accessories_app/screens/Home/mainHomepage.dart';
import 'package:electronic_accessories_app/screens/aboutus.dart';
import 'package:electronic_accessories_app/screens/bottomNavagationScreen.dart';
import 'package:electronic_accessories_app/screens/homeScren.dart';
import 'package:electronic_accessories_app/screens/login_scren.dart';
import 'package:electronic_accessories_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Login successful", (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      routes: {'/dashboard': (context) => const MyApp()},
      home: const LoginPage(),
    ));
    Finder txtFirst = find.byKey(const ValueKey("email"));
    await tester.enterText(txtFirst, "ingit.dost@gmail.com");
    Finder txtSecond = find.byKey(const ValueKey("password"));
    await tester.enterText(txtSecond, "12345678");
    Finder btnAdd = find.byKey(const ValueKey("login"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets("Register Sucesfully", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {'/register': (context) => const RegisterScreen()},
      home: const RegisterScreen(),
    ));
    Finder txtFirst = find.byKey(const ValueKey("username"));
    await tester.enterText(txtFirst, "Bakis");
    Finder txtSecond = find.byKey(const ValueKey("email"));
    await tester.enterText(txtSecond, "nitesh.manjil@gmail.com");
    Finder txtThird = find.byKey(const ValueKey("password"));
    await tester.enterText(txtThird, "1234567899");
    Finder btnAdd = find.byKey(const ValueKey("register"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets("Dashboard", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {'/login': (context) => const LoginPage()},
      home: const HomePage(),
    ));
    Finder btnAdd = find.byKey(const ValueKey("register"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.text("ShopWisely"), findsOneWidget);
  });

  testWidgets("Dashboardfind", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {'/register': (context) => const RegisterScreen()},
      home: const HomePage(),
    ));
    Finder btnAdd = find.byKey(const ValueKey("login"));
    await tester.press(btnAdd);
    await tester.pumpAndSettle();
    expect(find.text("All electronic\n accessories\n in one hand"),
        findsOneWidget);
  });
}
