import 'package:flutter/material.dart';
import 'package:myapp/data/questions.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';
 
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

 void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }


  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  

  @override
  Widget build(context) {
    Widget screenwidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenwidget = QuestionsScreen(choosenAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenwidget = ResultsScreen(choosenAnswer:selectedAnswers , onRestartQuiz: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 156, 24, 196),
                const Color.fromARGB(255, 103, 11, 119),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
