// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      choice: json['choice'] as String,
      isTheAnswer: json['isTheAnswer'] as bool,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'choice': instance.choice,
      'isTheAnswer': instance.isTheAnswer,
    };
