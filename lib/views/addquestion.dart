import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  late String question, option1, option2, option3, option4;
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
      ),
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Spacer(),
            TextFormField(
              validator: (val) => val!.isEmpty ? "Bạn hãy nhập câu hỏi" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                hintText: "Câu hỏi",
              ),
              onChanged: (val) {
                question = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) => val!.isEmpty ? "Bạn hãy nhập đáp án 1" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Đáp án 1(Correct Answer)",
              ),
              onChanged: (val) {
                option1 = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) => val!.isEmpty ? "Bạn hãy nhập đáp án 2" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Đáp án 2",
              ),
              onChanged: (val) {
                option2 = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) => val!.isEmpty ? "Bạn hãy nhập đáp án 3" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Đáp án 3",
              ),
              onChanged: (val) {
                option3 = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) => val!.isEmpty ? "Bạn hãy nhập đáp án 4" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Đáp án 4",
              ),
              onChanged: (val) {
                option4 = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Gửi",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    //uploadQuizData();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Thêm câu hỏi",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
