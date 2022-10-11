import 'package:flutter/material.dart';
import 'package:quiz_app/views/quiz_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: SizedBox(
          height: height * 0.08,
          width: width * 0.6,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QuizPage();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              child: const Text('Start')),
        ),
      ),
    );
  }
}
