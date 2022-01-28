import 'package:flutter/material.dart';
import 'package:app_perguntas/questao.dart';
import 'package:app_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  void Function(int) responder;

  Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada].cast()['respostas'] : [];
    // for(String textoResposta in respostas){
    //   widgets.add(Resposta(textoResposta, _responder));
    // }
    List<Widget> widgets = respostas
        .map((resposta) => Resposta(resposta['texto'].toString(), () => responder(int.parse(resposta['nota'].toString()))))
        .toList();

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        // O ... pega os elementos da lista respostas e joga dentro da lista atual
        ...widgets,
      ],
    );
  }
}
