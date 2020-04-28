import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 20,
                left: 30,
                child: Text('Máquina de aprendizagem',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w200))),
            SizedBox(
              height: 80,
            ),
            Positioned(
                top: 60,
                left: 50,
                child: Text('Eletrostática',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w300))),
            Container(
              padding: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height * 0.99,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: GridView.count(
                            crossAxisCount: 2,
                            children: List.generate(opcoes.length, (index) {
                              return Center(
                                child: OpcaoCard(opcao: opcoes[index]),
                              );
                            })),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Opcao {
  const Opcao({this.titulo, this.icon, this.rota});
  final String titulo;
  final IconData icon;
  final String rota;
}

const List<Opcao> opcoes = const <Opcao>[
  const Opcao(titulo: 'Eletrização', icon:FontAwesomeIcons.ruler , rota: 'eletrizacao'),
  const Opcao(titulo: 'Cargas elétricas', icon: FontAwesomeIcons.atom),
  const Opcao(titulo: 'Campo elétrico', icon:FontAwesomeIcons.arrowsAlt),
  const Opcao(titulo: 'Energia potencial elétrica', icon:FontAwesomeIcons.expandAlt),

];

class OpcaoCard extends StatelessWidget {
  const OpcaoCard({Key key, this.opcao}) : super(key: key);
  final Opcao opcao;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
              Navigator.pushNamed(context, '${opcao.rota}');

          },
          child: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(opcao.icon, size: 80.0,  color: Colors.blue[300]),
                  SizedBox(
                    height:  8,
                  ),
                  Text(opcao.titulo,
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ]),
          )),
    );
  }
}
