import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/quiz_bloc.dart';
import 'package:quiz_app/data/quiz_api.dart';
import 'package:quiz_app/theme.dart';
import 'package:quiz_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(data: QuizesApi()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quize App',
        theme: Mytheme.quizTheme,
        home: const Home(),
      ),
    );
  }
}
