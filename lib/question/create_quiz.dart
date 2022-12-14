import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/services/database.dart';
import 'package:flutter_appvutrungvinh_406394402/question/addquestion.dart';
import 'package:flutter_appvutrungvinh_406394402/sign_up_in/signin.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _fromKey = GlobalKey<FormState>();
  late String quizImageUrl, quizTitle, quizDescription, quizId;
  DatabaseServices databaseService = new DatabaseServices();
  bool _isLoading = false;
  creteQuizOnline() async {
    if (_fromKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgurl": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDescription
      };
      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddQuestion()));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _fromKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  children: [
                    Spacer(),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Bạn hãy nhập Url ảnh" : null,
                      decoration: const InputDecoration(
                        labelText: "Hình ảnh Url ",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Icon(
                          Icons.image,
                        ),
                      ),
                      onChanged: (val) {
                        quizImageUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Bạn hãy nhập chủ đề" : null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        labelText: "Chủ đề trắc nghiệm",
                        prefixIcon: Icon(
                          Icons.topic,
                        ),
                      ),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Bạn hãy nhập mô tả" : null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        labelText: "Mô tả chủ đề trắc nhiệm",
                        prefixIcon: Icon(
                          Icons.description,
                        ),
                      ),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        creteQuizOnline();
                      },
                      child: blueButton(context, "Thêm trắc nghiệm"),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
