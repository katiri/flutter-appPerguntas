import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  String texto;
  Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        fixedSize: MaterialStateProperty.all(Size(200, 25)),
      ),
      child: Text(
        texto,
        style: TextStyle(fontSize: 20),
      ),
      onPressed: quandoSelecionado,
    );
  }
}