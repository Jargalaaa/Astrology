import 'package:flutter/material.dart';
import './page/startpage.dart'; // Import the new startpage.dart file
import './page/loginPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import './page/signupPage.dart'; // Import the new signupPage.dart file
import './page/gender.dart'; // Import
import './page/planetPage.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 5));
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData.dark(),
      initialRoute: '/', // Initial route
      routes: {
        '/': (context) => const Startpage(),
        '/login': (context) => LoginPage(), // Route to LoginPage
        '/register': (context) => SignupPage(), // Route to SignupPage
        '/gender': (context) => GenderPage(), // Route to GenderPage
        '/planet': (context) => PlanetPage(), // Route to PlanetPage
      },
    );
  }
}
