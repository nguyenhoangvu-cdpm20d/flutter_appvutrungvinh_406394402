import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/profile/person.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/views/startscreen.dart';

void main() {
  runApp(QuizVTVApp());
}

class QuizVTVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Flutter',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartApp(),
    );
  }
}
