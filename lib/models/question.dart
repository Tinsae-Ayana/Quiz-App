import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_app/models/options.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  final String question;
  final List<Option> options;
  const Question({required this.question, required this.options});
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
