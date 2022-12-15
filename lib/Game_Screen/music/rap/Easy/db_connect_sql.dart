import 'dart:convert';

import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:http/http.dart' as http;

class DBConnect_Rap_Easy {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/rap/easy.json');
  Future<void> addQuestion(Rap Rap) async {
    http.post(url,
        body: json.encode({
          'title': Rap.title,
          'option': Rap.option,
        }));
  }

  Future<List<Rap>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Rap> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = Rap(
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
