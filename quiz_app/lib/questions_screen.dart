import 'package:flutter/material.dart';
import 'answer_button.dart';
import '../data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'start_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();

}

class _QuestionsScreenState extends State<QuestionsScreen> {
   var currentQuestionIndex = 0;
  void nextQuestion(String answer) {
    widget.onSelectAnswer(answer); // Notify the parent widget about the selected answer
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question , 
            style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 16,
              ),
              textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map((item){
              return AnswerButton(
                answer: item,
                onTap: (){
                  nextQuestion(item);
                },
              );
            })
          ],
      ),
      ),
    );
  }
}
