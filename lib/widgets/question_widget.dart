import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);
  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
      child: Text(
        'Câu hỏi ${indexAction + 1}/$totalQuestions: $question',
        style: TextStyle(fontSize: 24, color: neutral),
      ),
    );
  }
}
