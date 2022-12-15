import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../widgets/question_models.dart';

//C1 là C#
//C2 là C++
class DBConnect_Flutter_Diff {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/flutter/difficult.json');
  Future<void> addQuestion(Flutter flutter) async {
    http.post(url,
        body: json.encode({
          'title': flutter.title,
          'option': flutter.option,
        }));
  }

  Future<List<Flutter>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Flutter> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = Flutter(
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
