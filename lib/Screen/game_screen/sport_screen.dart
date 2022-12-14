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
                        text: 'TH??? THAO',
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
//-------------------------------------------B??ng ????-----------------------------------------//
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
                        'H??y ch???n m???c ????? m?? b???n mu???n ch??i',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'B??ng ???? l?? m???t m??n th??? thao ?????ng ?????i ???????c ch??i v???i qu??? b??ng h??nh c???u gi???a hai ?????i bao g???m 11 c???u th??? m???i b??n. N?? c?? kho???ng h??n 250 tri???u ng?????i ch??i ??? h??n 200 qu???c gia v?? v??ng l??nh th???, khi???n n?? tr??? th??nh m??n th??? thao ph??? bi???n nh???t tr??n th??? gi???i.',
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
                                      'D???',
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
                                  'Kh??',
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
                  'B??ng ????',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),

//-------------------------------------------B??ng chuy???n--------------------------------------//
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
                        'H??y ch???n m???c ????? m?? b???n mu???n ch??i',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'B??ng chuy???n l?? 1 m??n th??? thao Olympic, trong ???? 2 ?????i ???????c t??ch ra b???i 1 t???m l?????i. M???i ?????i c??? g???ng ghi ??i???m b???ng c??ch ????a ???????c tr??i b??ng ch???m ph???n s??n ?????i ph????ng theo ????ng lu???t quy ?????nh. B??? lu???t ho??n ch???nh kh?? r???ng.',
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
                                      'D???',
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
                                  'Kh??',
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
                  'B??ng Chuy???n',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),

//-------------------------------------------B??ng R???--------------------------------------//
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
                        'H??y ch???n m???c ????? m?? b???n mu???n ch??i',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'B??ng r??? l?? m???t m??n th??? thao ?????ng ?????i, trong ???? hai ?????i, th?????ng g???m n??m ho???c ba c???u th???, ?????i ?????u nhau tr??n m???t s??n h??nh ch??? nh???t ho???c n???a s??n ?????i v???i b??ng r??? ba ?????u ba, c???nh tranh v???i m???c ti??u ch??nh c???a n??m m???t qu??? b??ng',
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
                                      'D???',
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
                                  'Kh??',
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
                  'B??ng R???',
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
