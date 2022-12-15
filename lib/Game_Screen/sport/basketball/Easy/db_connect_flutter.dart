import 'dart:convert';

import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:http/http.dart' as http;

class DBConnect_BongRo_Easy {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/batketball/easy.json');
  Future<void> addQuestion(BongRo BongRo) async {
    http.post(url,
        body: json.encode({
          'title': BongRo.title,
          'option': BongRo.option,
        }));
  }

  Future<List<BongRo>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      print(data);
      List<BongRo> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = BongRo(
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
