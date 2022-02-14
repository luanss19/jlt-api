import 'package:app_jlt/model/Servico.dart';
import 'package:app_jlt/telas/listagemServicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

void atualizarservico() {
  runApp(MaterialApp(
    home: AtualizarServico(),

  ));}

class AtualizarServico extends StatelessWidget {

  Servico() {
    api.servico = Servico();
  }

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _valorController = TextEditingController();
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Atualização de Servicos"),
        ),
        bottomNavigationBar: barraInferior(),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _chaveForm,
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Insira os novos dados do Servico nos campos abaixo:",style: TextStyle(fontSize: 17),overflow: TextOverflow.ellipsis),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
                  child: TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
                  child: TextField(
                    controller: _valorController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Valor",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
                  child: TextField(
                    controller: _descricaoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Descrição",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

              ]),
            )));
  }

  Widget barraInferior() {
    return Builder(
      builder: (BuildContext context){
        return BottomAppBar(
          color: Colors.blue,
          child: FlatButton(
              textColor: Colors.white,
              child: Text("Salvar Alterações", style: TextStyle(fontSize: 25)),
              onPressed: () {
                if (_chaveForm.currentState.validate()) {
                  api.servico.nome = _nomeController.text;
                  api.servico.valor = _valorController.text;
                  api.servico.descricao = _descricaoController.text;
                  api.persistencia.atualizarServico();
                  Navigator.pop (context);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ListagemServicoAPI()
                      )
                  );
                }}),);
      },
    );
  }

}

