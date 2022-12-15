import 'dart:convert';

import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:http/http.dart' as http;

class DBConnect_SQL_Easy {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/sql/easy.json');
  Future<void> addQuestion(SQL sql) async {
    http.post(url,
        body: json.encode({
          'title': sql.title,
          'option': sql.option,
        }));
  }

  Future<List<SQL>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<SQL> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = SQL(
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
