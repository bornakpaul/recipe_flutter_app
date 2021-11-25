import 'package:flutter/material.dart';
import 'package:recipe/screens/home.dart';
import 'package:recipe/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstantEats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff186ea8),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'home': (context) => Home(),
        'onboard': (context) => Onboarding(),
      },
    );
  }
}
