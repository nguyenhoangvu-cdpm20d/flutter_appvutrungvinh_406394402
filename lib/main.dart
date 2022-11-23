import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/home.dart';
import 'package:flutter_appvutrungvinh_406394402/views/profile/person.dart';
import 'package:flutter_appvutrungvinh_406394402/views/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/views/startscreen.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(QuizVTVApp());
}

class QuizVTVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz VTV',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:
          FirebaseAuth.instance.currentUser == 'null' ? 'home' : 'start',
      routes: {
        'start': (context) => StartScreen(),
        'home': (context) => Home(),
      },
    );
  }
}
