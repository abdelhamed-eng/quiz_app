import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'summary_data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswer,
    required this.onRestartQuiz,
  });
  final List<String> choosenAnswer;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> get getSummaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].text[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final totalQuestions = questions.length;
    final numCorrectAnswers = getSummaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answered $numCorrectAnswers of $totalQuestions questions correctly',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            SummaryData(getSummaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestartQuiz,
              icon: Icon(Icons.restart_alt, color: Colors.white),
              label: const Text(
                'restart quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
