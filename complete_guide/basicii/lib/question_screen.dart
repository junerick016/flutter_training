import 'package:basicii/answer_button.dart';
import 'package:basicii/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  void anwserQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.text,
              style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              answerText: answer,
              onTap: () {
                anwserQuestion(answer);
              },
            );
          })
        ],
      ),
    );
  }
}
