import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/views/profile/editprofile.dart';
import 'package:flutter_appvutrungvinh_406394402/views/searchSreen.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

import '../question/create_quiz.dart';

class Person extends StatefulWidget {
  @override

  // TODO: implement createState
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // padding: EdgeInsets.only(top: 0),
              child: Text(
                'THÔNG TIN CÁ NHÂN ',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.redAccent.shade700,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: const Color.fromARGB(255, 170, 34, 34)
                              .withOpacity(0.3),
                          offset: const Offset(15, 15),
                          blurRadius: 15)
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 30),
              child: const CircleAvatar(
                radius: 65.0,
                backgroundImage: AssetImage('images/123.JPG'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Nguyen Hoang Vu',
                style: TextStyle(
                    color: Colors.redAccent.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Giới Tính: Nam',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.pink.shade600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'SDT: **********',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.pink.shade600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Năm Sinh: DD/MM/YYYY ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.pink.shade600,
                ),
              ),
            ),
            /*Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Tổng Điểm: ---',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color.fromARGB(255, 84, 0, 31),
                ),
              ),
            ),*/
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(255, 255, 0, 149),
                            Color.fromARGB(255, 255, 0, 149),
                            Color.fromARGB(255, 255, 0, 149),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ),
                      );
                    },
                    child: const Text(
                      'Chỉnh sửa thông tin cá nhân',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}