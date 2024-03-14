import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Functions/repeated.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordControl = TextEditingController();
  TextEditingController _emailControl = TextEditingController();
  TextEditingController _usernameControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sign Up ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 255, 238),
            Color.fromARGB(255, 40, 104, 214),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 25),
                reusableText('Enter Username:', Icons.person_outlined, false,
                    _usernameControl),
                const SizedBox(height: 25),
                reusableText('Enter Email address:', Icons.person_outlined,
                    false, _emailControl),
                const SizedBox(height: 25),
                reusableText('Enter Password:', Icons.lock_outline, true,
                    _passwordControl),
                const SizedBox(height: 25),
                loginSignUpButton(context, false, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
