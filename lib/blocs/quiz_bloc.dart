import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/data/quiz_api.dart';
import 'package:quiz_app/models/question.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizesApi data;

  QuizBloc({required this.data}) : super(const QuizState()) {
    on<NextButtonEvent>(_onNextButtonPressed);
    on<AnswerSelectedEvent>(_onAnswerSelected);
    on<LoadQuestionEvent>(_onLoadQuestion);
    on<QuestionNumberChange>(_onQuestionChange);
    data
        .getAllQuestion()
        .then((value) => add(LoadQuestionEvent(questions: value ?? [])));
  }
  _onLoadQuestion(event, emit) {
    emit(state.copyWith(questions: event.questions));
  }

  _onAnswerSelected(event, emit) {
    emit(state.copyWith(
        isAnswerSelected: event.isAnswerSelected,
        selectedOptionIndex: event.selectedOption));
  }

  _onNextButtonPressed(event, emit) {
    add(AnswerSelectedEvent(isAnswerSelected: false, selectedOption: 5));
    add(QuestionNumberChange(questionNumber: state.questionNumber + 1));
  }

  _onQuestionChange(event, emit) {
    emit(state.copyWith(questionNumber: event.questionNumber));
  }
}
