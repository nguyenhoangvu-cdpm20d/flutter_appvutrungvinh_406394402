import 'dart:convert';

import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:http/http.dart' as http;

class DBConnect_BongDa_Diff {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/football/difficult.json');
  Future<void> addQuestion(BongDa BongDa) async {
    http.post(url,
        body: json.encode({
          'title': BongDa.title,
          'option': BongDa.option,
        }));
  }

  Future<List<BongDa>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<BongDa> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = BongDa(
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
