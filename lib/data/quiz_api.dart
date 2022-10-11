import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/question.dart';

class QuizesApi {
  final String authority = '6z43r.mocklab.io';
  final String path = 'question';

  Future<List<Question>?> getAllQuestion() async {
    final url = Uri.https(authority, path);
    final response = await http.get(url);
    debugPrint('Out side the check');
    if (response.statusCode == 200) {
      debugPrint('Inside the check');
      debugPrint(response.body);
      return jsonDecode(response.body)
          .map<Question>((e) => Question.fromJson(e))
          .toList();
    } else {
      return null;
    }
  }
}
