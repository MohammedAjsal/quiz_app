import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_app/answer_button.dart';
import 'package:third_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectedAnswer, super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final curretQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              curretQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 203, 153, 251),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              // const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ...curretQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answer: answer,
                action: () {
                  answerQuestion(answer);
                },
              );
              //  action: answerQuestion);
            }),
            // AnswerButton(answer: curretQuestion.answers[0], action: () {}),
            // AnswerButton(answer: curretQuestion.answers[1], action: () {}),
            // AnswerButton(answer: curretQuestion.answers[2], action: () {}),
            // AnswerButton(answer: curretQuestion.answers[3], action: () {}),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Answer2"),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Answer3"),
            // ),
          ],
        ),
      ),
    );
  }
}
