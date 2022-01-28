// ignore_for_file: prefer_const_constructors

import 'package:app_perguntas/resposta.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  int pontuacao;
  void Function() reiniciar;

  Resultado({required this.pontuacao, required this.reiniciar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Parabéns!',
            style: TextStyle(fontSize: 30),
          )
        ),
        Text(
          'Sua pontuação foi de $pontuacao\n',
          style: TextStyle(fontSize: 30),
        ),
        Resposta('Reiniciar', reiniciar),
      ],
    );
  }
}
