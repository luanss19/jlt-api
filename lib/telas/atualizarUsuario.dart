import 'package:app_jlt/model/Usuario.dart';
import 'package:app_jlt/telas/listagemUsuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

void atualizarUsuario() {
  runApp(MaterialApp(
    home: AtualizarUsuario(),

  ));}




class AtualizarUsuario extends StatelessWidget {

  Atualizar() {
    api.usuario = Usuario();
  }

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Atualização de usuarios"),
        ),
        bottomNavigationBar: barraInferior(),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _chaveForm,
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Insira os novos dados do usuario nos campos abaixo:",style: TextStyle(fontSize: 17),overflow: TextOverflow.ellipsis),
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
                    controller: _loginController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Login",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
                  child: TextField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
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
                  api.usuario.nome = _nomeController.text;
                  api.usuario.login = _loginController.text;
                  api.usuario.senha = _senhaController.text;
                  api.persistencia.atualizarUsuario();
                  Navigator.pop (context);
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ListagemUsuarioAPI()
                      )
                  );
                }}),);
      },
    );
  }

}

