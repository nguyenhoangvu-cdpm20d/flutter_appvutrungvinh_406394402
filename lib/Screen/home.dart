import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/music_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/sport_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/study_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/XepHang/ChiTietBXH.dart';
import 'package:flutter_appvutrungvinh_406394402/lich_su/LichSu.dart';
import 'package:flutter_appvutrungvinh_406394402/services/contact/contact_tab.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/question/create_quiz.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/person.dart';
import 'package:flutter_appvutrungvinh_406394402/sign_up_in/signin.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/searchSreen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  Stream? quizStream;

  int selectedIndex = 2;
  final Widget _myHome = MyHome();
  final Widget _mySearch = MySrearch();
  final Widget _challenge = Challenge();
  final Widget _person = PerSon();
  final Widget _friend = Friend();

  Widget getBody() {
    if (selectedIndex == 2) {
      return _myHome; //trang chủ
    } else if (selectedIndex == 0) {
      return _mySearch; //tìm kiếm
    } else if (selectedIndex == 1) {
      return _challenge; //thách đấu
    } else if (selectedIndex == 3) {
      return _friend; //bạn bè
    } else {
      return _person; //trang cá nhân
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 70, 128),
        //backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: Row(
          children: [
            IconButton(
              onPressed: (() {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 229, 184, 244),
                      title: const Text(
                        'Bạn có muốn đăng xuất?',
                        style: TextStyle(
                          color: Colors.pink,
                        ),
                      ),
                      icon: const Icon(
                        Icons.output_rounded,
                        color: Colors.pink,
                      ),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: [
                        TextButton(
                          onPressed: () {
                            //FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                // ignore: prefer_const_constructors
                                builder: (BuildContext context) => SignIn(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
              icon: Icon(Icons.logout),
              iconSize: 40,
              color: Colors.black,
            ),
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
      ),
      body: getBody(),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.flip,
          backgroundColor: Colors.pink,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const TabItem(icon: Icons.shopping_cart, title: 'Cửa hàng'),
            const TabItem(icon: Icons.bar_chart_sharp, title: 'Xếp hạng'),
            const TabItem(icon: Icons.house, title: 'Trang chủ'),
            const TabItem(icon: Icons.history, title: 'Bạn Bè'),
            const TabItem(icon: Icons.person_outline, title: 'Trang Cá Nhân'),
          ],
          initialActiveIndex: 2,
          onTap: (int index) {
            onTapHandler(index);
          }),
    );
  }
}

class MyHome extends StatelessWidget {
  //Màn hình trang chủ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 184, 244),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: ((context, index) {
            return Column(
              children: [
//------------------------------------Ngôn ngữ lập trình------------------------------------
                Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // ignore: prefer_const_constructors
                          builder: (BuildContext context) => StudyScreen(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            'images/bg_IT.png',
                            width: 500,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Ngôn Ngữ Lập Trình',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
//------------------------------------Thể thao------------------------------------
                Row(
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (BuildContext context) => SportScreen(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Image.asset(
                                'images/bg_bongda.jpg',
                                width: 188,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Thể Thao',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
//----------------------------------Âm nhạc----------------------------------
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (BuildContext context) => MusicScreen(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Image.asset(
                                'images/bg_amnhac.png',
                                width: 175,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Âm nhạc',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          })),
    );
  }
}

class Challenge extends StatelessWidget {
  //Màn hình thách đấu
  @override
  Widget build(BuildContext context) {
    return ChiTietBXH();
  }
}

class MySrearch extends StatelessWidget {
  //Màn hình tìm kiếm
  @override
  Widget build(BuildContext context) {
    return searchScreen();
  }
}

class PerSon extends StatelessWidget {
  //Màn hình trang cá nhân
  @override
  Widget build(BuildContext context) {
    return Person();
  }
}

class Friend extends StatelessWidget {
  //Màn hình Bạn bè
  @override
  Widget build(BuildContext context) {
    return //const Center(child: Text("Màn hình ban be "));
        LichSu();
  }
}
