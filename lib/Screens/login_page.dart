import 'package:flutter/material.dart';
import 'package:flutter/src/painting/gradient.dart';

import '../Functions/repeated.dart';
import 'home_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordControl = TextEditingController();
  TextEditingController _emailControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 21, 95, 159),
            Color.fromARGB(255, 11, 30, 62),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logo("assets/images/Film_Station_icon.png"),
                const SizedBox(height: 25),
                reusableText('Enter Username:', Icons.person_outlined, false,
                    _emailControl),
                const SizedBox(height: 25),
                reusableText('Enter Password:', Icons.lock_outline, true,
                    _passwordControl),
                const SizedBox(height: 25),
                loginSignUpButton(context, true, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't have an account? ",
          style: TextStyle(color: Colors.white70, fontSize: 20)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      )
    ]);
  }
}
