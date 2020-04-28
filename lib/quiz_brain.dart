import 'model/Question.dart';

class QuizBrain{

  int _questionNumber = 0;
  Map<String, dynamic> questoes ={};

  List<Question> _questionBank = [
    Question('A régua de plástico é atritada com','papel' ,'madeira', 'pedra', 'vidro', 'papel'),
    Question('Depois de atritada com a folha de papel, a régua pasou a ter uma nova propriedade, a de ___________ pequenos pedaçõs de papel','atrair', 'repelir','cortar','atrair','colar' ),
    Question('A régua de plástico é atritada com uma folha de','papel' ,'papel', 'metal', 'vidro', 'planta'),
    Question('Antes de ser atritada com papel, a régua ___________,','alterou' ,'esfriou', 'alterou', 'parou', 'não alterou'),
    Question('A parte da régra atritada com papel (produziu; não produziu) alteração na trajetória da ápa quandotrazida pata suÍts proxirnidades.','alterou' ,'esfriou', 'alterou', 'parou', 'não alterou'),
    Question('A parte da régua atritada com papel  ___________,','alterou' ,'esfriou', 'alterou', 'parou', 'não alterou'),
    Question('Antes de ser atritada com papel, a régua ___________,','alterou' ,'esfriou', 'alterou', 'parou', 'não alterou'),

  ];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

   Map<String, dynamic> getQuestionText(){
      return  questoes= {
                            "questao":  _questionBank[_questionNumber].question,
                            "a": _questionBank[_questionNumber].a1,
                            "b": _questionBank[_questionNumber].a2,
                            "c": _questionBank[_questionNumber].a3,
                            "d": _questionBank[_questionNumber].a4,
                            
                          };
  }

  String getCorrectAnswer(){
    return _questionBank[_questionNumber].resposta;
  }
}


