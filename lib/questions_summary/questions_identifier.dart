import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.correctAnswer, required this.questionIndex});
  final int questionIndex;
  final bool correctAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: correctAnswer
            ? Color.fromARGB(255, 150, 198, 241)
            : Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          questionNumber.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 22, 2, 56),
          ),
          // ((['question_index'] as int) + 1).toString(),
        ),
      ),
    );
  }
}
