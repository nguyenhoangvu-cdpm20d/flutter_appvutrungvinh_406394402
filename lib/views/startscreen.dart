import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/home.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signup.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(width: 20.0, height: 100.0),
                    const Text(
                      'QUIZ',
                      style: TextStyle(
                        fontSize: 57.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        shadows: [
                          Shadow(
                              color: Colors.blueAccent,
                              offset: Offset(6, 1),
                              blurRadius: 10)
                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0, height: 100.0),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 57.0,
                        fontFamily: 'Horizon',
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.blueAccent,
                              offset: Offset(6, 1),
                              blurRadius: 10)
                        ],
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText('VTV'),
                          RotateAnimatedText('VU'),
                          RotateAnimatedText('TRUNG'),
                          RotateAnimatedText('VINH'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              /*Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: const Text(
                  'Đăng Nhập',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                ).then((value) {
                  if (value != null) {
                    final snackBar = SnackBar(content: Text(value));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
              child: const Text(
                'Đăng Ký',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pinkAccent)),
            )*/
            ),
          ],
        ),
      ),
    );
  }
}
