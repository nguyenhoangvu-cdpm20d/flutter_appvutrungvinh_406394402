import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../widgets/question_models.dart';

//C1 là C#
//C2 là C++
class DBConnect_BongRo_Diff {
  final url = Uri.parse(
      'https://vtv-app-d0566-default-rtdb.firebaseio.com/questions/batketball/difficult.json');
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
