import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/services/contact/contact_tab.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/question/create_quiz.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/person.dart';
import 'package:flutter_appvutrungvinh_406394402/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/study/Flutter/Diff/Flutter_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/study/Flutter/Easy/Flutter_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/study/PHP/Diff/php_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/study/PHP/Easy/php_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/study/SQL/Diff/php_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/study/SQL/Easy/sql_question_screen.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/shopSreen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => StudyScreenState();
}

class StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 70, 128),
        foregroundColor: Colors.white,
        //backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 28),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'NGÔN NGỮ LẬP TRÌNH',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: '',
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
//-------------------------------------------PHP-----------------------------------------//
          Card(
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(255, 229, 184, 244),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        title: Text(
                          'Hãy chọn mức độ mà bạn muốn chơi',
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          'PHP: Hypertext Preprocessor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 115),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            // ignore: prefer_const_constructors
                                            builder: (BuildContext context) =>
                                                PHP_Easy_QuestionScreen(),
                                          ),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      child: Text(
                                        'Dễ',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink,
                                        ),
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        // ignore: prefer_const_constructors
                                        builder: (BuildContext context) =>
                                            PHP_Diff_QuestionScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: Text(
                                    'Khó',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'images/php.png',
                      width: 500,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'PHP',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),

//-------------------------------------------Flutter--------------------------------------//
          Card(
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(255, 229, 184, 244),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        title: Text(
                          'Hãy chọn mức độ mà bạn muốn chơi',
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          'Flutter framework',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 115),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            // ignore: prefer_const_constructors
                                            builder: (BuildContext context) =>
                                                Flutter_Easy_QuestionScreen(),
                                          ),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      child: Text(
                                        'Dễ',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink,
                                        ),
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        // ignore: prefer_const_constructors
                                        builder: (BuildContext context) =>
                                            Flutter_Diff_QuestionScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: Text(
                                    'Khó',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'images/flutter.png',
                      width: 500,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Flutter',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),

//-------------------------------------------SQL Sever--------------------------------------//
          Card(
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(255, 229, 184, 244),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        title: Text(
                          'Hãy chọn mức độ mà bạn muốn chơi',
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          'Microsoft SQL Server: Hệ quản trị cơ sở dữ liệu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 115),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            // ignore: prefer_const_constructors
                                            builder: (BuildContext context) =>
                                                SQL_Easy_QuestionScreen(),
                                          ),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      child: Text(
                                        'Dễ',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink,
                                        ),
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        // ignore: prefer_const_constructors
                                        builder: (BuildContext context) =>
                                            SQL_Diff_QuestionScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: Text(
                                    'Khó',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'images/SQL.jpg',
                      width: 500,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    'Microsoft SQL Server',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
