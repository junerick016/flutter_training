import 'package:basicii/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:basicii/start_screen.dart';
import 'package:basicii/question_screen.dart';
import 'package:basicii/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activePage = 'start-screen';

  void switchPage() {
    setState(() {
      activePage = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activePage = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchPage);
    if (activePage == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (activePage == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        reStartQuiz: () {
          setState(() {
            activePage = 'start-screen';
            selectedAnswers = [];
          });
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 24, 3, 254),
                Color.fromARGB(255, 13, 226, 95)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
