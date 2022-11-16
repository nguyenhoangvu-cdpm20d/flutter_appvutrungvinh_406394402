import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/home.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signin.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    AnimationController controller;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context, false);
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(
                // ignore: prefer_const_constructors
                builder: (BuildContext context) => SignIn(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          child: RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 80),
              children: <TextSpan>[
                TextSpan(
                  text: 'Quiz',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: '',
                    color: Colors.black54,
                    shadows: [
                      Shadow(
                          color: Colors.blueAccent,
                          offset: Offset(2, 1),
                          blurRadius: 10)
                    ],
                  ),
                ),
                TextSpan(
                  text: 'VTV',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: '',
                    color: Colors.pinkAccent,
                    shadows: [
                      Shadow(
                          color: Colors.blueAccent,
                          offset: Offset(2, 1),
                          blurRadius: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
