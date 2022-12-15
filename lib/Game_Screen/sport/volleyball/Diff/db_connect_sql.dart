import 'dart:convert';

import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:http/http.dart' as http;

class DBConnect_BongChuyen_Diff {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/volleyball/difficult.json');
  Future<void> addQuestion(BongChuyen BongChuyen) async {
    http.post(url,
        body: json.encode({
          'title': BongChuyen.title,
          'option': BongChuyen.option,
        }));
  }

  Future<List<BongChuyen>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<BongChuyen> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = BongChuyen(
          id: key,
          title: value['title'],
          option: Map.castFrom(value['option']),
        );
        newQuestions.add(newQuestion);
      }));
      return newQuestions;
    });
  }
}
