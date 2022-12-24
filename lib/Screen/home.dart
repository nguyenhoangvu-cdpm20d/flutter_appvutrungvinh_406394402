import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/music_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/sport_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/study_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/XepHang/ChiTietBXH.dart';
import 'package:flutter_appvutrungvinh_406394402/lich_su/LichSu.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/question/create_quiz.dart';
import 'package:flutter_appvutrungvinh_406394402/profile/person.dart';
import 'package:flutter_appvutrungvinh_406394402/services/contact/contact_detail.dart';
import 'package:flutter_appvutrungvinh_406394402/services/contact/contact_tab.dart';
import 'package:flutter_appvutrungvinh_406394402/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/object.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/shopSreen.dart';
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
  final Widget shop = Shop();
  final Widget _rank = Rank();
  final Widget _person = PerSon();
  final Widget _history = History();

  Widget getBody() {
    if (selectedIndex == 2) {
      return _myHome; //trang chủ
    } else if (selectedIndex == 0) {
      return shop; //tìm kiếm
    } else if (selectedIndex == 1) {
      return _rank; //thách đấu
    } else if (selectedIndex == 3) {
      return _history; //lịch sử
    } else {
      return _person; //trang cá nhân
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final ref = FirebaseDatabase.instance.ref();

  List<UserObject> lsUser = [];
  String uidUser = "";
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        uidUser = user.uid;
      }
    });
    userData(); // kt va hien thi thong tin
    setState(() {});
  }

  void userData() {
    ref.child("users").onChildAdded.listen((data) {
      UserObject userObject = UserObject.fromJson(data.snapshot.value as Map);
      lsUser.add(userObject);
      setState(() {});
    });
  }

  Vang() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return lsUser[i].vang;
      }
    }
    return 'Chưa có thông tin';
  }

  Diem() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return lsUser[i].diem;
      }
    }
    return 'Chưa có thông tin';
  }

  avatar() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return lsUser[i].image;
      }
    }
    return '';
  }

  Ten() {
    for (int i = 0; i < lsUser.length; i++) {
      if (lsUser[i].uid == uidUser) {
        return lsUser[i].name;
      }
    }
    return 'Chưa có thông tin';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 229, 184, 244),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: avatar() == ''
                        ? CircleAvatar(
                            child: Text('No Image'),
                          )
                        : CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(avatar()),
                          ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          '' + Ten(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 229, 184, 244),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Điểm: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${Diem()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Vàng: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${Vang()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.red,
                size: 35,
              ),
              title: Text(
                'Trang cá nhân',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // ignore: prefer_const_constructors
                    builder: (BuildContext context) => PerSon(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.orange,
                size: 35,
              ),
              title: Text(
                'Lịch sử chơi',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // ignore: prefer_const_constructors
                    builder: (BuildContext context) => LichSu(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_outlined,
                color: Colors.red,
                size: 35,
              ),
              title: Text(
                'Bạn bè',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // ignore: prefer_const_constructors
                    builder: (BuildContext context) => ContactTab(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.orange,
                size: 35,
              ),
              title: Text(
                'Cài đặt',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {},
            ),
            ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 35,
                ),
                title: Text(
                  'Đăng xuất',
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
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
                              'Đồng ý',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 109, 9),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Đóng',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 241, 20, 20),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 70, 128),
        //backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 50),
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
            const TabItem(icon: Icons.history, title: 'Lịch sử'),
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

class Rank extends StatelessWidget {
  //Màn hình thách đấu
  @override
  Widget build(BuildContext context) {
    return ChiTietBXH();
  }
}

class Shop extends StatelessWidget {
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

class History extends StatelessWidget {
  //Màn hình Lịch Sử
  @override
  Widget build(BuildContext context) {
    return //const Center(child: Text("Màn hình ban be "));
        LichSu();
  }
}
