import 'package:flutter/material.dart';
import '/home_screen.dart';
import '/signup_screen.dart';
import '/side_navigation_screen.dart';
import 'initial_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const Homepage(),
        '/sideNavigation': (context) => SideNavigation(),
      },
    );
  }
}
