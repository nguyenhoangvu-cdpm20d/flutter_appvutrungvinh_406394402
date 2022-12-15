import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../widgets/question_models.dart';

//C1 là C#
//C2 là C++
class DBConnect_Pop_Diff {
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
