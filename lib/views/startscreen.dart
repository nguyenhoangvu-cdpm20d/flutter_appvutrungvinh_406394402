import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/signin.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    AnimationController controller;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
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
