import 'model/Question.dart';

class QuizBrain{

  int _questionNumber = 0;
  int questionNumber = 1;

  Map<String, dynamic> questoes ={};

  List<Question> _questionBank = [
    Question('A régua de plástico é atritada com','papel' ,'madeira', 'pedra', 'vidro', 'papel'),
    Question('Ao ser aproximada dos pedaços de papel, antes de ser atritada, a régua os atraiu?','sim' ,'sim', 'não', '',''),
    Question('Depois de atritada com a folha de papel, a régua pasou a ter uma nova propriedade, a de ___________ pequenos pedaçõs de papel','atrair', 'repelir','cortar','atrair','colar' ),
    Question('A régua de plástico é atritada com uma folha de','papel' ,'papel', 'metal', 'vidro', 'planta'),
    Question('Antes de ser atritada com papel, a régua','não alterou' ,'alterou', 'não alterou', '', ''),
    Question('A parte da régra atritada com papel ___________ alteração na trajetória da água quando trazida pata suas proximidades.','produziu' ,'não produziu', 'produziu', '', ''),
    Question('A parte da régua atritada com papel __________ as moléculas de água','atraiu' ,'atraiu', 'não atraiu', '', ''),
    Question('O dispostivo montado no Quadro C chama-se ','pêndulo elétrico' ,'régua', 'cortiça', 'pêndulo magnético', 'pêndulo elétrico'),
    Question('Aproximando-se a régua não atritada com papel do pêndulo elétrico, observou-se ujma alteração no estado de movimento do isopor?','não' ,'sim', 'não', '',''),
    Question('Você acaba de verifìcar o comportamento de um objeto (régua ou pente) quando atritado com outro objeto diferente (papel ou lenço). Dizemos que a régua fìcou eletrizada por atrito. O mesmo resultado experimental seria obtido se, ao invés de aproximarmos a régua dos elementos anteriormente indicados, tivéssemos aproximado a parte da folha de papel que foi atritada com a régua. Logo, podemos concluir que a folha de papel atritada com a régua também fica','eletrizada' ,'estática', 'eletrizada', 'em movimento','em repouso'),


    // Question('Antes de ser atritada com papel, a régua ___________,','alterou' ,'esfriou', 'alterou', 'parou', 'não alterou'),

    
    // Question('A parte da régua atritada com papel  ___________,','alterou' ,'esfriou', 'alterou', 'parou', 'não alterou'),
    // Question('Antes de ser atritada com papel, a x ___________,','alterou' ,'esfriou', 'alterou', 'parou', 'não alterou'),

  ];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      questionNumber++;
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


