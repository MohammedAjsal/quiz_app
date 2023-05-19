import 'package:flutter/material.dart';
import 'package:third_app/data/questions.dart';
import 'package:third_app/questions_screen.dart';
import 'package:third_app/results_screen.dart';
import 'home_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var activeScreen = "home-screen";

  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = HomeScreen(quizStart: switchScreeen);
  //   super.initState();
  // }

  void switchScreeen() {
    setState(() {
      activeScreen = "questions-screen";
      // const QuestionsScreen();
    });
  }

  void chooseAnswers(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = "home-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(quizStart: switchScreeen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswers);
    }
    if (activeScreen == "results-screen") {
      screenWidget =
          ResultsScreen(restart: restartQuiz, choosenAnswers: _selectedAnswers);
      //
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 82, 33, 167),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
