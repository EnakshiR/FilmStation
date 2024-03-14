import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/watch_list_page.dart';
import 'package:flutter_application_1/Screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FILM STATION',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 1, 24, 45),
      ),
      home: const Homepage(),
      //home: LoginPage(),
      //home: WatchListPage(),
    );
  }
}
