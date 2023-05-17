import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(66, 61, 57, 57),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10)),
            child: Text(answerText),
          ),
        ],
      ),
    );
  }
}
