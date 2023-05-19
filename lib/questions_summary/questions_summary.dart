import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_app/questions_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(width: 5, color: Colors.white, style: BorderStyle.solid),
      ),
      padding: const EdgeInsets.all(25),
      height: 435,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
