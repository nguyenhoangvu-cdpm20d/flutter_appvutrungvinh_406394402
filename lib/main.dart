import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/signin.dart';

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
      home: SignIn(),
    );
  }
}
