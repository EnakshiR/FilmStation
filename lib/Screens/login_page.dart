import 'package:flutter/material.dart';

import '../Functions/repeated.dart';
import 'home_page.dart';
import 'sign_up_page.dart';

//Created a class for Login Page
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordControl =
      TextEditingController(); //Controlling the text input of the password field.
  TextEditingController _emailControl =
      TextEditingController(); //Controlling the text input of the email field.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(255, 1, 24, 45)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              logo(
                  "assets/images/Film_Station_icon.png"), //App logo and name will be displayed
              const SizedBox(height: 20),
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
              signUpOption(), //Sign up option will be displayed
            ],
          ),
        ),
      ),
    );
  }

  //Function returns a row containing text "Don't have an account?" followed by a clickable "Sign Up" text. Tapping on "Sign Up" navigates to the SignUpPage
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
