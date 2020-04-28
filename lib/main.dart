import 'package:flutter/material.dart';
import 'package:quizzler/screen/home_screen.dart';
import 'model/Question.dart';

import 'quiz_brain.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      routes: {'eletrizacao' : (context) =>QuizPage(),},
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
          body:
           SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText()["questao"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    quizBrain.getQuestionText()["a"],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    String result = quizBrain.getCorrectAnswer();
                    if (result == quizBrain.getQuestionText()["a"]) {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        quizBrain.nextQuestion();
                      });
                    } else {
                      Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) =>
          imagemAtv2()));
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                  },
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.green,
                  child: Text(
                    quizBrain.getQuestionText()["b"],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    String result = quizBrain.getCorrectAnswer();
                    if (result == quizBrain.getQuestionText()["b"]) {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        quizBrain.nextQuestion();
                      });
                    } else {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                  },
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    quizBrain.getQuestionText()["c"],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    String result = quizBrain.getCorrectAnswer();
                    if (result == quizBrain.getQuestionText()["c"]) {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        quizBrain.nextQuestion();
                      });
                    } else {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                  },
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.green,
                  child: Text(
                    quizBrain.getQuestionText()["d"],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    String result = quizBrain.getCorrectAnswer();
                    if (result == quizBrain.getQuestionText()["d"]) {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        quizBrain.nextQuestion();
                      });
                    } else {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      });
                    }
                  },
                ),
              ),
          ),
          Expanded(
              child: Row(
                children: scoreKeeper,
              ),
          ),
        ],
      ),
           ),
    );
  }
  
}

class imagemAtv2 extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Colors.white.withOpacity(0.90),
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Releia atentamente para encontrar a resposta',
        style: TextStyle(color: Colors.black,fontSize : 16,
        fontWeight: FontWeight.bold,
        ),),
      ),
      Container(
        height: 500,
            decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage(
                  'assets/papel.png'),
              fit: BoxFit.contain,
            ),
          ),
      ),
    ],
  ), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
  );
 }
}
