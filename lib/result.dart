// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './main.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resethandler;

  Result(this.resultScore, this.resethandler);

  String get resultPhrase {
    var resultText = "You have completed the Quiz";
    if (resultScore <= 9) {
      resultText = "You are awesome and innocent";
    } else if (resultScore > 9 && resultScore <= 18) {
      resultText = "Pretty likeable";
    } else if (resultScore > 18) {
      resultText = "You are.. strange?!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resethandler, child: Text("Restart Quiz"))
        ],
      ),
    );
  }
}
