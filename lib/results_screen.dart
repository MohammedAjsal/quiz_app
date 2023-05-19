import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_app/data/questions.dart';
import 'package:third_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {required this.restart, required this.choosenAnswers, super.key});
  final List<String> choosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    // final summaryData = getSummaryData();
    final numberOfTotalQuestion = questions.length;
    final numberCorrectQuestion = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              // textAlign: TextAlign.center,
              "You  Answered $numberCorrectQuestion of $numberOfTotalQuestion questions Correctly!",
              style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData
                // getSummaryData(),
                ),
            const SizedBox(height: 30),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              onPressed: restart,
              label: const Text(
                "Restart Quiz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
