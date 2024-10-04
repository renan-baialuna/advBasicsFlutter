import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerText, this.inTap, {super.key});

  final String answerText;
  final void Function() inTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    backgroundColor: Colors.white
                  ),
                
                  onPressed: inTap,
                  child: Text(answerText),
                );



  }

}