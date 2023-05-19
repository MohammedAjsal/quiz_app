import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Widget spacing = SizedBox(
  height: 80,
);

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.quizStart, super.key});
  final void Function() quizStart;
  Widget build(context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 300,
          //   ),
          // ),
          spacing,
          Text(
            "Learn Flutter The Fun Way !",
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
                fontWeight: FontWeight.bold),
            // TextStyle(
            //   color: Colors.white,
            //   fontSize: 25,
            // ),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
                // backgroundColor: const Color.fromARGB(255, 107, 15, 168),
                foregroundColor: Colors.white),
            onPressed: quizStart,
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
