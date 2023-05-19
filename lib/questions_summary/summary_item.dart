import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_app/questions_summary/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              correctAnswer: isCorrectAnswer,
              questionIndex: itemData['question_index'] as int),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemData['user_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 90, 142, 130),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      itemData['correct_answer'] as String,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 30, 212, 179),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      size: 12,
                      Icons.check_circle,
                      color: Color.fromARGB(255, 30, 212, 179),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
