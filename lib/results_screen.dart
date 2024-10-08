import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  List<String> choosenAnwers;

  bool toStart = false;

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

  ResultsScreen({super.key, required this.choosenAnwers, required this.onReset});

  final void Function() onReset;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSumaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    // screenWidget = ResultsScreen(choosenAnwers: selectedAnswers);

    void startOver() {
      onReset();
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answered $numCorrectQuestions correctly out of $numTotalQuestions',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: startOver,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.refresh_outlined),
              label: Text('Start Quiz')),
          ],
        ),
      ),
    );
  }
}
