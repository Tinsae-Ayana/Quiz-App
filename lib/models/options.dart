import 'package:json_annotation/json_annotation.dart';
part 'options.g.dart';

@JsonSerializable()
class Option {
  final String choice;
  final bool isTheAnswer;
  const Option({required this.choice, required this.isTheAnswer});
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
