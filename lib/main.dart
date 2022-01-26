// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:app_perguntas/questao.dart';
import 'package:app_perguntas/resposta.dart';
import 'package:flutter/material.dart';

// main(){
//   runApp(PerguntaApp());
// }

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget{
  PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Azul', 'Vermelho', 'Verde']
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': ['Cavalo', 'Cachorro', 'Papagaio']
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': ['João', 'Bia', 'Maria']
    }
  ];

  void _responder(){
    if((_perguntaSelecionada + 1) < perguntas.length){
      setState(() {
        _perguntaSelecionada++;
      });
    }
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context){
    
    List<String> respostas = perguntas[_perguntaSelecionada].cast()['respostas'];
    // for(String textoResposta in respostas){
    //   widgets.add(Resposta(textoResposta, _responder));
    // }
    List<Widget> widgets = respostas.map((textoResposta) => Resposta(textoResposta, _responder)).toList();


    return MaterialApp(
      // home: Text('Olá mundo!'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App de perguntas'),
        ),
        // body: const Text('Olá Flutter!'),
        body: Column(
          children: <Widget> [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            // O ... pega os elementos da lista respostas e joga dentro da lista atual
            ...widgets,
          ],
        ),
      ),
    );
  }
}