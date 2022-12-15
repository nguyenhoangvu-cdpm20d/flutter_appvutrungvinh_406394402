import 'dart:convert';

import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:http/http.dart' as http;

class DBConnect_Pop_Easy {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/pop/easy.json');
  Future<void> addQuestion(Pop Pop) async {
    http.post(url,
        body: json.encode({
          'title': Pop.title,
          'option': Pop.option,
        }));
  }

  Future<List<Pop>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      print(data);
      List<Pop> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = Pop(
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
