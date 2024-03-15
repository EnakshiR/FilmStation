import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //// Removes the debug banner at the top right corner
      title: 'FILM STATION',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 1, 24,
            45), // It sets the theme data for the entire application. Sets a dark theme with a custom scaffold background color.
      ),
      home: LoginPage(), //The app will open directly to the Login Page
    );
  }
}
