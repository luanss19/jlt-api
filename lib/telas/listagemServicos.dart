import 'package:app_jlt/telas/atualizarProduto.dart';
import 'package:app_jlt/telas/atualizarServico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';


class ListagemServicoAPI extends StatefulWidget {
  @override
  _ListagemServicoAPIState createState() => _ListagemServicoAPIState();
}

class _ListagemServicoAPIState extends State<ListagemServicoAPI> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serviços"),
      ),
      body: FutureBuilder(
          future: api.persistencia.carregarServico(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: api.persistencia.servicos.length,
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
        title: Text(api.persistencia.servicos[index]["nome"]),
        trailing:Wrap(
            spacing: 12,
            children:<Widget>[
              FlatButton.icon(onPressed: () {
                api.persistencia.deletarServico();
              },
                  icon: Icon(Icons.restore_from_trash),
                  label: Text("Remover")),
              FlatButton.icon(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => AtualizarServico()
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