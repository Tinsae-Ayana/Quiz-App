part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final bool isAnswerSelected;
  final List<Question> questions;
  final int questionNumber;
  final int selectedOptionIndex;
  const QuizState(
      {this.isAnswerSelected = false,
      this.selectedOptionIndex = 5,
      this.questions = const [],
      this.questionNumber = 0});

  @override
  List<Object?> get props =>
      [isAnswerSelected, questions, selectedOptionIndex, questionNumber];

  QuizState copyWith(
      {isAnswerSelected, questions, questionNumber, selectedOptionIndex}) {
    return QuizState(
        selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
        isAnswerSelected: isAnswerSelected ?? this.isAnswerSelected,
        questionNumber: questionNumber ?? this.questionNumber,
        questions: questions ?? this.questions);
  }
}
