part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {}

class NextButtonEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class AnswerSelectedEvent extends QuizEvent {
  AnswerSelectedEvent(
      {required this.isAnswerSelected, required this.selectedOption});
  final bool isAnswerSelected;
  final int selectedOption;

  @override
  List<Object?> get props => [isAnswerSelected, selectedOption];
}

class LoadQuestionEvent extends QuizEvent {
  LoadQuestionEvent({required this.questions});
  final List<Question> questions;

  @override
  List<Object?> get props => [questions];
}

class QuestionNumberChange extends QuizEvent {
  final int questionNumber;
  QuestionNumberChange({required this.questionNumber});

  @override
  List<Object?> get props => [questionNumber];
}
