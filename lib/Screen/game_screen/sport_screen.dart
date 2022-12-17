import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/sport/basketball/Diff/bongro_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/sport/basketball/Easy/bongro_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/sport/football/Diff/bongda_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/sport/football/Easy/bongda_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/sport/volleyball/Diff/bongchuyen_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/sport/volleyball/Easy/bongchuyen_question_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/services/contact/contact_tab.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/question/create_quiz.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/person.dart';
import 'package:flutter_appvutrungvinh_406394402/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/shopSreen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({super.key});

  @override
  State<SportScreen> createState() => SportScreenState();
}

class SportScreenState extends State<SportScreen> {
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
                        text: 'THỂ THAO',
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
      body: Column(children: [
//-------------------------------------------Bóng đá-----------------------------------------//
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
                        'Bóng đá là một môn thể thao đồng đội được chơi với quả bóng hình cầu giữa hai đội bao gồm 11 cầu thủ mỗi bên. Nó có khoảng hơn 250 triệu người chơi ở hơn 200 quốc gia và vùng lãnh thổ, khiến nó trở thành môn thể thao phổ biến nhất trên thế giới.',
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
                                              BongDa_Easy_QuestionScreen(),
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
                                          BongDa_Diff_QuestionScreen(),
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
                    'images/bongda.jpg',
                    width: 500,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Bóng Đá',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),

//-------------------------------------------Bóng chuyền--------------------------------------//
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
                        'Bóng chuyền là 1 môn thể thao Olympic, trong đó 2 đội được tách ra bởi 1 tấm lưới. Mỗi đội cố gắng ghi điểm bằng cách đưa được trái bóng chạm phần sân đối phương theo đúng luật quy định. Bộ luật hoàn chỉnh khá rộng.',
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
                                              BongChuyen_Easy_QuestionScreen(),
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
                                          BongChuyen_Diff_QuestionScreen(),
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
                    'images/bongchuyen.png',
                    width: 500,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Bóng Chuyền',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),

//-------------------------------------------Bóng Rổ--------------------------------------//
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
                        'Bóng rổ là một môn thể thao đồng đội, trong đó hai đội, thường gồm năm hoặc ba cầu thủ, đối đầu nhau trên một sân hình chữ nhật hoặc nửa sân đối với bóng rổ ba đấu ba, cạnh tranh với mục tiêu chính của ném một quả bóng',
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
                                              BongRo_Easy_QuestionScreen(),
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
                                          BongRo_Diff_QuestionScreen(),
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
                    'images/bongro.jpg',
                    width: 500,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Bóng Rổ',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
