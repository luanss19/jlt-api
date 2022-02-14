import 'package:app_jlt/telas/atualizarProduto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';


class ListagemProdutoAPI extends StatefulWidget {
  @override
  _ListagemProdutoAPIState createState() => _ListagemProdutoAPIState();
}

class _ListagemProdutoAPIState extends State<ListagemProdutoAPI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      body: FutureBuilder(
          future: api.persistencia.carregarProduto(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: api.persistencia.produtos.length,
                  itemBuilder: (context, index) {
                    return construirItemLista(context, index);
                  });
            }
            return Container();
          }),
    );
  }

  Widget construirItemLista(context, index) {
    return ListTile(
        title: Text(api.persistencia.produtos[index]["nome"]),
        trailing:Wrap(
          spacing: 12,
        children:<Widget>[
          FlatButton.icon(onPressed: () {
            api.persistencia.deletarProduto();
          },
              icon: Icon(Icons.restore_from_trash),
              label: Text("Remover")),
          FlatButton.icon(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => AtualizarProduto()
                )
            );
          },
              icon: Icon(Icons.cached),
              label: Text("Atualizar")),
        ]
        )

    );
  }
}

