import 'dart:convert';

import 'package:flutter_appvutrungvinh_406394402/widgets/question_models.dart';
import 'package:http/http.dart' as http;

class DBConnect_Edm_Diff {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/edm/dificult.json');
  Future<void> addQuestion(Edm Edm) async {
    http.post(url,
        body: json.encode({
          'title': Edm.title,
          'option': Edm.option,
        }));
  }

  Future<List<Edm>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Edm> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = Edm(
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
