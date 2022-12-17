import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/music/edm/Easy/db_connect_sql.dart';
import 'package:flutter_appvutrungvinh_406394402/Game_Screen/sport/volleyball/Easy/db_connect_sql.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/home.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/LSObject.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/object.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/constants.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/next_button.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/option_card.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/question_widget.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/result_box_music.dart';

class Edm_Easy_QuestionScreen extends StatefulWidget {
  const Edm_Easy_QuestionScreen({super.key});

  @override
  State<Edm_Easy_QuestionScreen> createState() =>
      Edm_Easy_QuestionScreenState();
}

class Edm_Easy_QuestionScreenState extends State<Edm_Easy_QuestionScreen> {
  var db = DBConnect_Edm_Easy();
  // List<Question> _question = [
  //   Question(id: '1', title: ' Edm tượng trưng cho cái gì:', option: {
  //     'Preprocessed Hypertext Page': false,
  //     ' ': false,
  //     'Edm: Hypertext Preprocessor': true,
  //     'Hypertext Markup Language': false
  //   }),
  //   Question(
  //       id: '2',
  //       title: ' Đoạn mã nào sau đây được sử dụng để chú thích Edm',
  //       option: {
  //         ' /* commented code here */': false,
  //         '// you are handsome': false,
  //         '# you are gay': false,
  //         'Tất cả các ý trên': true,
  //       }),
  //   Question(
  //       id: '3',
  //       title:
  //           ' Mặc định của một biến không có giá trị được thể hiện với từ khóa',
  //       option: {
  //         'none': false,
  //         'null': true,
  //         'undef': false,
  //         'Không có khái niệm như vậy trong Edm': false,
  //       }),
  //   Question(
  //       id: '4',
  //       title: ' Ký hiệu nào được dùng khi sử dụng biến trong Edm',
  //       option: {
  //         ' /* commented code here */': false,
  //         '// you are handsome': false,
  //         '# you are gay': false,
  //         'Tất cả các ý trên': true,
  //       }),
  //   Question(
  //       id: '5',
  //       title: ' Hàm nào sau đây dùng để khai báo hằng số',
  //       option: {
  //         'const': false,
  //         'constants': false,
  //         'def': false,
  //         'define': true,
  //       }),
  //   Question(
  //       id: '6',
  //       title:
  //           ' Đáp án nào sau đây không được xác định trước bởi Edm (Magic constants)',
  //       option: {
  //         ' __LINE__': false,
  //         '__FILE__': false,
  //         '__DATE__': true,
  //         '__METHOD__': false,
  //       }),
  //   Question(
  //       id: '7',
  //       title: '   ',
  //       option: {
  //         '===': false,
  //         '>=': true,
  //         '!=': false,
  //         '<=': false,
  //       }),
  //   Question(
  //       id: '8',
  //       title: ' Lệnh nào dùng để xuất 1 mảng ra trang web',
  //       option: {
  //         'print_r': true,
  //         'echo': false,
  //         'out': false,
  //         'print': false,
  //       }),
  //   Question(id: '9', title: ' Phát biểu nào sau đây là đúng', option: {
  //     'Lệnh include dùng để nhúng file Edm vào trang': true,
  //     'Lệnh include dùng để chạy 1 file Edm rồi nhúng kết quả của file đó vào trang':
  //         false,
  //     'Lệnh include chỉ có thể được dùng 1 lần trong trang': false,
  //     'Lệnh include có thể nhúng file html, Edm, js, css': false,
  //   }),
  //   Question(id: '10', title: ' Ai là người phát triển Edm', option: {
  //     'Rasmus Lerdorf': true,
  //     'Guido Van Rossum': false,
  //     'James Gosling': false,
  //     'Brendan Eich': false,
  //   }),
  // ];
  Future? _questions;
  Future<List<Edm>> getData() async {
    return db.fetchQuestion();
  }

  int time = 50;
  List<LSObject> lsLichSu = [];
  List<UserObject> lsUser = [];
  String uidUser = "";
  String uidLichSu = "";
  final ref = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidLichSu = user.uid;
      }
    });
    userData();
    _questions = getData();
    super.initState();
    thoigian();
    LichSuData();
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  void LichSuData() {
    ref.child("history").onChildAdded.listen((data) {
      LSObject lsObject = LSObject.fromJson(data.snapshot.value as Map);
      lsLichSu.add(lsObject);
      setState(() {});
    });
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1 || time == 0) {
      FirebaseAuth auth = FirebaseAuth.instance;
      final ref = FirebaseDatabase.instance.ref().child('users');
      for (int i = 0; i < lsUser.length; i++) {
        if (uidUser == lsUser[i].uid) {
          ref.child(lsUser[i].uid).update({
            'diem': lsUser[i].diem + score * 10,
            'vang': lsUser[i].vang - 50 + score * 10
          });
        }
      }
      FirebaseAuth auth1 = FirebaseAuth.instance;
      final reff = FirebaseDatabase.instance.ref().child('history');
      for (int i = 0; i < lsLichSu.length; i++) {
        if (uidLichSu == lsLichSu[i].uid) {
          reff.child(lsLichSu[i].uid).update({
            'tenchude': 'EDM',
            'chedo': 'Dễ',
            'diem': score * 10,
            'thoigian': 50 - time,
            'sl': score,
            'vang': score * 10,
          });
        }
      }
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                thoigian: 50 - time,
                result: score,
                questionLength: questionLength,
                onpressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Vui lòng chọn đáp án trước khi qua câu mới",
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void thoigian() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          time--;
        });
      } else if (time == 50) {
        setState(() {
          time--;
        });
      } else {
        timer.cancel();
        setState(() {});
      }
    });
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        // ignore: prefer_const_constructors
        builder: (BuildContext context) => Home(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Edm>>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Edm>;
            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 244, 70, 128),
                foregroundColor: Colors.white,
                //backgroundColor: Colors.transparent,
                elevation: 0.0,
                brightness: Brightness.light,
                title: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 45),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 50),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Quiz',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: '',
                                    color: Colors.black)),
                            TextSpan(
                              text: 'VTV',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: '',
                                color: Color.fromARGB(255, 162, 4, 57),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                actions: [
                  Padding(
                    padding: const EdgeInsets.all(
                      18.0,
                    ),
                    child: Text(
                      'Điểm: $score',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(
                  18.0,
                ),
                child: Column(
                  children: [
                    QuestionWidget(
                      indexAction: index,
                      question: extractedData[index].title,
                      totalQuestions: extractedData.length,
                    ),
                    const Divider(
                      color: neutral,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    for (int i = 0; i < extractedData[index].option.length; i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                            extractedData[index].option.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index].option.keys.toList()[i],
                          color: isPressed
                              ? extractedData[index]
                                          .option
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : neutral,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(90.0),
                      child: Text(
                        time.toString(),
                        style: TextStyle(
                            fontSize: 75,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButtton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
