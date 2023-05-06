import 'package:ezapplyadmin/uicode/pages/dashboard.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons.dart';
import '../widgets/logo.dart';
import '../widgets/textinput.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              applogo(tagline: "Sign with admin account"),
              const SizedBox(height: 25),
              Inputtext(labeltext: "Email"),
              const SizedBox(height: 12),
              Inputtext(labeltext: "Password"),
              const SizedBox(height: 12),
              // SizedBox(
              //   width: size.width / 1.3,
              //   child: Align(
              //     alignment: Alignment.centerRight,
              //     child: Text(
              //       "Forget Password",
              //       style: TextStyle(fontSize: 12, color: colorss.primary),
              //     ),
              //   ),
              // ),
              largeButton(
                text: "Login",
                onpress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ));
                },
                colorss: colorss,
              ),
              const SizedBox(height: 12),
              // richtext(
              //     onpress: (() {
              //       Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => Signuppage(),
              //           ));
              //     }),
              //     text1: "Don't have and account?",
              //     text2: 'Register',
              //     context: context)
            ],
          ),
        ),
      ),
    );
  }
}
