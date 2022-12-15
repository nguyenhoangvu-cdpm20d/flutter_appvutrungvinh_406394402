import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/music_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/game_screen/study_screen.dart';
import 'package:flutter_appvutrungvinh_406394402/Screen/home.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {Key? key,
      required this.thoigian,
      required this.result,
      required this.questionLength,
      required this.onpressed})
      : super(key: key);
  final int thoigian;
  final int result;
  final int questionLength;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kết Quả',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Gold: ${result * 10}',
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              child: Text(
                "$result/$questionLength",
                style: TextStyle(fontSize: 30),
              ),
              radius: 70,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow //kq=1/2
                  : result < questionLength / 2
                      ? incorrect //kq<1/2
                      : correct, //kq>1/2
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Điểm: ${result}   Thời gian: ${thoigian}',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              result == questionLength / 2
                  ? 'Cố thêm nhé !!' //kq=1/2
                  : result < questionLength / 2
                      ? 'Khá buồn !!' //kq<1/2
                      : 'Thật bất ngờ !!', //kq>1/2
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 40, 174, 7)),
                ),
                child: Text(
                  'Thoát',
                ),
                onPressed: () {
                  // FirebaseAuth auth = FirebaseAuth.instance;
                  // final ref = FirebaseDatabase.instance.ref().child('users');
                  // for (int i = 0; i < lsUser.length; i++) {
                  //   if (uidUser == lsUser[i].uid) {
                  //     ref.child(lsUser[i].uid).update({
                  //       'diem': 10,
                  //     });
                  //   }
                  // }
                  // Navigator.pushAndRemoveUntil<void>(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     // ignore: prefer_const_constructors
                  //     builder: (BuildContext context) => MusicScreen(),
                  //   ),
                  //   (Route<dynamic> route) => false,
                  // );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (BuildContext context) => Home(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
