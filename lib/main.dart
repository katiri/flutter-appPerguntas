// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:app_perguntas/questao.dart';
import 'package:app_perguntas/questionario.dart';
import 'package:app_perguntas/resposta.dart';
import 'package:app_perguntas/resultado.dart';
import 'package:flutter/material.dart';

// main(){
//   runApp(PerguntaApp());
// }

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacao = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 10},
        {'texto': 'Verde', 'nota': 0},
      ]
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'nota': 0},
        {'texto': 'Cachorro', 'nota': 5},
        {'texto': 'Papagaio', 'nota': 10},
      ]
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'João', 'nota': 10},
        {'texto': 'Bia', 'nota': 5},
        {'texto': 'Maria', 'nota': 0},
      ]
    }
  ];

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacao += nota;
      });
    }
    print(_pontuacao);
  }

  void _reiniciar(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacao = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text('Olá mundo!'),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('App de perguntas'),
          ),
          // body: const Text('Olá Flutter!'),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  responder: _responder,
                )
              : Resultado(
                pontuacao: _pontuacao,
                reiniciar: _reiniciar,
              )
        ),
    );
  }
}
