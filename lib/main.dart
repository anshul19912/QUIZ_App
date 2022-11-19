// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 3},
        {'text': 'Green', 'score': 11},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favorite Animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Lion', 'score': 11},
        {'text': 'Monkey', 'score': 5},
        {'text': 'Dog', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favorite subject?',
      'answers': [
        {'text': 'Maths', 'score': 8},
        {'text': 'English', 'score': 10},
        {'text': 'Hindi', 'score': 7},
        {'text': 'Computer', 'score': 12},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _answerQuestion(int score) {
    _totalscore = _totalscore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First App"),
            ),
            body: _questionIndex < questions.length
                ? Column(children: [
                    Question(questions[_questionIndex]['questionText']
                        as String), // or questions.elementAt(0)

                    ...(questions[_questionIndex]['answers']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(
                          () => _answerQuestion(answer['score'] as int),
                          answer['text'] as String);
                    }).toList()
                  ])
                : Result(_totalscore, _resetQuiz)));
  }
}
