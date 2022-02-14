import 'package:app_jlt/telas/atualizarProduto.dart';
import 'package:app_jlt/telas/atualizarUsuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';


class ListagemUsuarioAPI extends StatefulWidget {
  @override
  _ListagemUsuarioAPIState createState() => _ListagemUsuarioAPIState();
}

class _ListagemUsuarioAPIState extends State<ListagemUsuarioAPI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuarios"),
      ),
      body: FutureBuilder(
          future: api.persistencia.carregarUsuario(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: api.persistencia.usuarios.length,
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
        title: Text(api.persistencia.usuarios[index]["nome"]),
        trailing:Wrap(
            spacing: 12,
            children:<Widget>[
              FlatButton.icon(onPressed: () {
                api.persistencia.deletarUsuario();
              },
                  icon: Icon(Icons.restore_from_trash),
                  label: Text("Remover")),
              FlatButton.icon(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => AtualizarUsuario()
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

