import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/quiz_bloc.dart';
import 'package:quiz_app/models/question.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: state.questions == const <Question>[]
              ? const Center(child: CircularProgressIndicator())
              : QuizBody(width: width, height: height),
        );
      },
    );
  }
}

class QuizBody extends StatelessWidget {
  const QuizBody({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(
              color: Colors.black,
              thickness: 3,
              indent: width * 0.3,
              endIndent: width * 0.3,
            ),
            SizedBox(height: height * 0.07),
            Text(
                context
                    .read<QuizBloc>()
                    .state
                    .questions[context.read<QuizBloc>().state.questionNumber]
                    .question,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: height * 0.07),
            Expanded(
                child: ListView(
              children: const [
                OptionTile(0, 'A'),
                OptionTile(1, 'B'),
                OptionTile(2, 'C'),
                OptionTile(3, 'D'),
              ],
            )),
            SizedBox(
              height: height * 0.09,
            ),
            context.read<QuizBloc>().state.isAnswerSelected &&
                    context.read<QuizBloc>().state.questionNumber < 4
                ? SizedBox(
                    height: height * 0.08,
                    width: width * 0.6,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<QuizBloc>().add(NextButtonEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        child: const Text('Next')),
                  )
                : const SizedBox(),
            SizedBox(
              height: height * 0.09,
            ),
          ]),
    );
  }
}

class OptionTile extends StatelessWidget {
  final int optionNumber;
  final String label;
  const OptionTile(this.optionNumber, this.label, {Key? key}) : super(key: key);

  _colorPicker(state, context) {
    if (state.isAnswerSelected) {
      if (state.selectedOptionIndex == optionNumber &&
          state.questions[state.questionNumber].options[optionNumber]
              .isTheAnswer) {
        return Theme.of(context).highlightColor;
      } else if (state.selectedOptionIndex == optionNumber) {
        return Theme.of(context).errorColor;
      } else {
        return Colors.grey;
      }
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      if (!context.read<QuizBloc>().state.isAnswerSelected) {
        context.read<QuizBloc>().add(AnswerSelectedEvent(
            isAnswerSelected: true, selectedOption: optionNumber));
      }
    }, child: BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
      return Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: _colorPicker(state, context),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ))),
            const SizedBox(width: 20),
            Text(
              state
                  .questions[state.questionNumber].options[optionNumber].choice,
              style: TextStyle(color: _colorPicker(state, context)),
            )
          ],
        ),
      );
    }));
  }
}
