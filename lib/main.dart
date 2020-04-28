import 'package:flutter/material.dart';
import 'package:quizzler/screen/home_screen.dart';
import 'model/Question.dart';
import 'package:page_transition/page_transition.dart';

import 'quiz_brain.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'eletrizacao': (context) => Eletrizacao(),
      },
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

  bool visivel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Questão número ${quizBrain.questionNumber}'),
              backgroundColor: Colors.blue[300],
              actions: <Widget>[
          FlatButton(
            child: Text(
              "VOLTAR A HOME",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          )
        ],

      ),
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
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
                                                  respotas();

                      });
                    } else {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rotate,
                              child: Eletrizacao()));
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
                                                  respotas();

                      });
                    } else {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rotate,
                              child: Eletrizacao()));
                    }
                  },
                ),
              ),
            ),
            Visibility(
              visible: visivel,
              child: Expanded(
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
                                                    respotas();

                        });
                      } else {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rotate,
                                child: Eletrizacao()));
                      }
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: visivel,
              child: Expanded(
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
                                                    respotas();

                        });
                      } else {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rotate,
                                child: Eletrizacao()));
                      }
                    },
                  ),
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

  respotas() {
    if (quizBrain.getQuestionText()["c"] != '' &&
        quizBrain.getQuestionText()["d"] != '') {
          visivel = true;
            print('entrou');
                }
    else {
      visivel = false;
                  print('entrou em baixo');

    }
  }
}

class Eletrizacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eletrização'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "RESPONDER",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => QuizPage()));
            },
          )
        ],
      ),
      backgroundColor: Colors.blue.withOpacity(0.90),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Leia atentamente para encontrar as resposta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.42,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage('assets/papel.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.42,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage('assets/quadrob.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.42,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage('assets/quadrod.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.185,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage('assets/quadrod2.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
    );
  }
}
