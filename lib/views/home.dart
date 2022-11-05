import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/views/create_quiz.dart';
import 'package:flutter_appvutrungvinh_406394402/views/person.dart';
import 'package:flutter_appvutrungvinh_406394402/views/signin.dart';
// ignore: unused_import
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';
import 'package:flutter_appvutrungvinh_406394402/views/searchSreen.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? quizStream;
  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: ((context, index) {
                    return QuizTitle(
                      imgUrl: snapshot.data.documents[index].data["quizImgurl"],
                      desc: snapshot.data.documents[index].data["quizDesc"],
                      title: snapshot.data.documents[index].data["quizTitle"],
                      quizid: snapshot.data.documents[index].data["quizId"],
                    );
                  }),
                );
        },
      ),
    );
  }

  int selectedIndex = 1;
  final Widget _myHome = MyHome();
  final Widget _myCategorys = MyCategorys();
  final Widget _challenge = Challenge();
  Widget getBody() {
    if (selectedIndex == 1) {
      return _myHome;
    } else if (selectedIndex == 0) {
      return _myCategorys;
    } else {
      return _challenge;
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
        backgroundColor: Color.fromARGB(255, 244, 70, 128),
        foregroundColor: Colors.white,
        //backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: Row(
          children: [
            Container(
              //padding: const EdgeInsets.only(left: 80),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 30),
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
                              color: Color.fromARGB(255, 162, 4, 57))),
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 108),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => searchSreen()));
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                //backgroundColor: Colors.pinkAccent,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/123.JPG'),
                  radius: 65.0,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.play_arrow,
                color: Colors.pinkAccent,
              ),
              title: Text(
                'Chơi ngay',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.pinkAccent,
              ),
              title: Text(
                'Cài đặt',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.pinkAccent,
              ),
              title: Text(
                'Trang cá nhân',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Person()));
              },
            ),
            SizedBox(height: 30),
            ListTile(
                leading: const Icon(
                  Icons.output_rounded,
                  color: Colors.red,
                ),
                title: const Text(
                  'Đăng xuất',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Đăng xuất khỏi ứng dụng?'),
                          icon: Icon(Icons.notifications),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: [
                            TextButton(
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
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        );
                      });
                }),
          ],
        ),
      ),
      /* body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),*/

      body: getBody(),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.flip,
          backgroundColor: Colors.pink,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const TabItem(icon: Icons.list, title: 'Chủ đề'),
            TabItem(icon: Icons.house, title: '            '),
            TabItem(icon: Icons.gamepad_outlined, title: 'Thách đấu'),
          ],
          initialActiveIndex: 1,
          onTap: (int index) {
            onTapHandler(index);
          }),
    );
  }
}

class QuizTitle extends StatelessWidget {
  late final String imgUrl;
  late final String title;
  late final String desc;
  late final String quizid;
  // ignore: use_key_in_widget_constructors
  QuizTitle(
      {required this.imgUrl,
      required this.title,
      required this.desc,
      required this.quizid});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.push(
        //context, MaterialPageRoute(builder: (context) => PlayQuiz(quizid)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  //Màn hình trang chủ
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Coming Soon"));
  }
}

class MyCategorys extends StatelessWidget {
  //Màn hình chủ đề
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Coming Soon"));
  }
}

class Challenge extends StatelessWidget {
  //Màn hình thách đấu
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Coming Soon"));
  }
}
