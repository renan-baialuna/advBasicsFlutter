import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> { 
  String? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    // activeScreen = StartScreen(switchScreen);
    activeScreen = 'start-screen';
    // TODO: implement initState
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    print('resposta: ' + answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void resetTest() {

      setState(() {
        activeScreen = 'start-screen';
        selectedAnswers = [];
      });

  }

  void switchScreen() {
    setState(() {
      // activeScreen = QuestionsScreen();
      activeScreen = 'questions-screen';
    });   
  }

  void switchStart() {
        setState(() {
      // activeScreen = QuestionsScreen();
      activeScreen = 'start-screen';


    }); 
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == 'start-screen'
    //   ? StartScreen(switchScreen)
    //   : QuestionsScreen(onSelectAnswer: chooseAnswer);
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
          onSelectAnswer: chooseAnswer,
        );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        choosenAnwers: selectedAnswers, 
        onReset: resetTest,
      );

    }

    if (activeScreen == 'to-start') {
      screenWidget = StartScreen(switchStart);
    } 

    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 105, 23, 153),
        body: Container (
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 Colors.purple, 
                 Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              )
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
