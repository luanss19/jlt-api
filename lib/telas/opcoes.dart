import 'package:app_jlt/telas/cadastroProduto.dart';
import 'package:app_jlt/telas/cadastroServico.dart';
import 'package:app_jlt/telas/cadastroUsuario.dart';
import 'package:app_jlt/telas/listagemProdutos.dart';
import 'package:app_jlt/telas/listagemServicos.dart';
import 'package:app_jlt/telas/listagemUsuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_jlt/model/Produto.dart';

import '../main.dart';
import '../model/persistencia.dart';


void opcoes() {
  runApp(MaterialApp(
    home: Opcoes(),
  ));
}

List<Produto> produtos = List();

class Opcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opções"),
      ),
      body: body(),
    );
  }

  Widget body() {
    return ListView.builder(
        padding: EdgeInsets.all(15.0),
        itemCount: 1,
        itemBuilder: (context, index) {
          return _CardsSelecao(context, index);
        });
  }
}

Widget _CardsSelecao(BuildContext context, int index) {
  return SingleChildScrollView(
      child: Column(children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Produtos",
                      style: TextStyle(fontSize: 25),
                      overflow: TextOverflow.ellipsis,
                    ),

                    Row(
                      children: <Widget>[
                        FlatButton.icon(onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => CadastroProduto()));},
                            icon: Icon(Icons.add),
                            label: Text("Adicionar")),
                        FlatButton.icon(onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => ListagemProdutoAPI()));},
                            icon: Icon(Icons.list),
                            label: Text("Listar")),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Serviços",
                      style: TextStyle(fontSize: 25),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton.icon(onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => CadastroServico()));},
                            icon: Icon(Icons.add),
                            label: Text("Adicionar")),
                        FlatButton.icon(onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => ListagemServicoAPI()));},
                            icon: Icon(Icons.list),
                            label: Text("Listar")),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Usuários",
                      style: TextStyle(fontSize: 25),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton.icon(onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => CadastroUsuario()));},
                            icon: Icon(Icons.add),
                            label: Text("Adicionar")),
                        FlatButton.icon(onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => ListagemUsuarioAPI()));},
                            icon: Icon(Icons.list),
                            label: Text("Listar")),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ]));
}
