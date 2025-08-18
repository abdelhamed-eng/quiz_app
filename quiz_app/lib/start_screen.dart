import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
 @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 200, height: 200),
          SizedBox(height: 30),
          Text(
            'learn flutter in a fun way',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 30),
          TextButton.icon(
            onPressed: startQuiz,
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            label: Text('Get Started', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
