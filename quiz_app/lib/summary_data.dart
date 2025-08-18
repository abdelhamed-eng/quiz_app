import 'package:flutter/material.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1).toString()), //as int we put it to avoid error
                 Expanded(
                   child: Column(
                    children: [
                      Text(data['question'] as String , style: const TextStyle(color: Colors.white),),
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String ,
                      style: TextStyle(
                        color: data['user_answer'] == data['correct_answer'] ? Colors.green : Colors.red,
                      ),
                      ),
                      Text(data['correct_answer'] as String),
                    ],
                   ),
                 )
              ],
            );
          }).toList(), //to list converts the iterable to a list
        ),
      ),
    ); 
  }
}
