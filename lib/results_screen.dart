import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> choosenAnwers;
  List<Map<String, Object>> getSumaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnwers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnwers[i]
        },
      );
    }
    return summary;
  }

  const ResultsScreen({super.key, required this.choosenAnwers});
  @override
  Widget build(BuildContext context) {
    final summaryData = getSumaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    void startOver() {}

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you answered $numCorrectQuestions correctly out of $numTotalQuestions'),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData), 
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Text('restart'))
          ],
        ),
      ),
    );
  }
}
