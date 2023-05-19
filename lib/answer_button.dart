import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({required this.answer, required this.action, super.key});

  final void Function() action;
  final String answer;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
